/*
 * rand_junk.cpp
 *
 * program autputing given ammount of random junks at a high speed to stdout.
 * this is much faster that reading from /dev/urandom, though it is far from
 * being truely random.
 *
 * in general there is a thread reading constantly from /dev/urandom, thread
 * introducing random changes to data sets and main thread that outputs
 * all of this on the screen.
 *
 * downloaded from http://www.baszerr.eu
 *
 */
#include <mutex>
#include <atomic>
#include <thread>
#include <vector>
#include <random>
#include <fstream>
#include <iostream>
#include <stdexcept>
#include <algorithm>
#include <functional>
#include <condition_variable>
#include <cstdint>
#include <cassert>
#include <boost/noncopyable.hpp>
#include <boost/lexical_cast.hpp>

using namespace std;


typedef atomic<bool> ProcessFlag;


class Sync
{
public:
  typedef unique_lock<mutex> Lock;

  Sync(void):
    ready_{false}
  { }

  void waitForTrigger(void)
  {
    Lock lock(m_);
    while(!ready_)
      cond_.wait(lock);
    ready_=false;
  }

  void trigger(void)
  {
    Lock lock(m_);
    ready_=true;
    cond_.notify_one();
  }

private:
  mutex              m_;
  condition_variable cond_;
  bool               ready_;
}; // class Sync


struct SharedBuffer
{
  typedef vector<uint8_t>   Bytes;
  typedef lock_guard<mutex> Lock;

  explicit SharedBuffer(const size_t size):
    buf_(size)
  { }

  Bytes      buf_;
  std::mutex m_;
}; // struct SharedBuffer


char* toChar(uint8_t *p)
{
  return static_cast<char*>( static_cast<void*>(p) );
}


class Mangler: private boost::noncopyable
{
public:
  explicit Mangler(SharedBuffer &output):
    local_( output.buf_.size() ),
    output_(output),
    xored_( local_.size() ),
    uniformInt_{0, 255},
    rnd_{ rdi_() },
    rndi_{ bind(uniformInt_, rnd_) }
  {
    // sanity checks
    assert( local_.size() == output_.buf_.size() );
    assert( xored_.size() == output_.buf_.size() );
    // initialize with random data
    randInit(local_);
    randInit(xored_);
  }

  virtual ~Mangler(void)
  { }

  void runUntil(const ProcessFlag &done, Sync &sync)
  {
    while(!done)
    {
      runOnce();
      sync.waitForTrigger();
    }
  }

  void runOnce(void)
  {
    // call the user's mangling function
    mangle();
    // before output xor it with the previous data
    xorData();
    // output the data
    SharedBuffer::Lock lock{output_.m_};
    xored_.swap(output_.buf_);
    assert( xored_.size() == output_.buf_.size() );
  }


protected:
  inline uint8_t randByte(void) { return rndi_(); }

  // buffer to be used by derived classes
  SharedBuffer::Bytes local_;

private:
  virtual void mangle(void) = 0;

  void randInit(SharedBuffer::Bytes &v)
  {
    for_each( v.begin(), v.end(), [this](const uint8_t c){ return c^randByte(); } );
  }

  void xorData(void)
  {
    if( xored_.size() != local_.size() )
      throw std::logic_error{"local buffer's size changed by derived class"};
    transform( local_.begin(), local_.end(),
               xored_.begin(),
               xored_.begin(),
               [](const uint8_t c1, const uint8_t c2){ return c1^c2; } );
  }

  // external buffer
  SharedBuffer &output_;

  // internal, helper buffer
  SharedBuffer::Bytes xored_;

  // random bytes
  uniform_int_distribution<> uniformInt_;
  random_device              rdi_;
  knuth_b                    rnd_;
  function<uint8_t()>        rndi_;
}; // class Mangler


// reads random seed in the background
struct RandReader: public Mangler
{
  explicit RandReader(SharedBuffer &out):
    Mangler{out}
  { }

private:
  virtual void mangle(void)
  {
    // read some random portion of data
    ifstream in;
    in.open("/dev/urandom", ios::binary|ios::in);
    if(!in.is_open())
      throw std::runtime_error("unable to open /dev/urandom");
    in.read( toChar(&local_[0]), local_.size() );
  }
}; // struct RandReader


// randomly changes data
struct RandOpts: public Mangler
{
  explicit RandOpts(SharedBuffer &out):
    Mangler{out}
  { }

private:
  virtual void mangle(void)
  {
    uint8_t      seed    =randByte();
    unsigned int reSeedIn=randByte()+13;
    unsigned int counter =0;
    // xor the universe
    for(uint8_t &c: local_)
    {
      c^=seed;
      if(++counter>=reSeedIn)
      {
        seed    =randByte();
        counter =0;
        reSeedIn=6+randByte()+randByte();
      } // if()
    } // for()
  }
}; // struct RandOpts


template<typename M>
struct Thread: private boost::noncopyable
{
  Thread(SharedBuffer &shared, ProcessFlag &done):
    mangler_{shared},
    shared_(shared),
    done_(done),
    th_{ [&]() mutable {
                         // initialize with some random data
                         mangler_.runOnce();
                         syncReady_.trigger();
                         // perform regular runs, on demand
                         mangler_.runUntil(done, sync_);
                       } }
  { }

  ~Thread(void)
  {
    // force thread shutdown
    done_=true;
    sync_.trigger();
    th_.join();
  }

  void waitUntilReady(void) { syncReady_.waitForTrigger(); }

  void trigger(void) { sync_.trigger(); }

private:
  M             mangler_;
  Sync          sync_;
  Sync          syncReady_;
  SharedBuffer &shared_;
  ProcessFlag  &done_;
  thread        th_;
}; //struct Thread


int main(int argc, const char **argv)
{
  if(argc!=2)
  {
    cerr<<argv[0]<<" <size_in_MB>"<<endl;
    return 42;
  }

  constexpr size_t mb   =1024*1024;
  constexpr size_t size =1*mb;
  const     size_t count=boost::lexical_cast<size_t>(argv[1]);

  // preare buffers
  SharedBuffer        shared{size};
  SharedBuffer::Bytes junks(size);
  ProcessFlag         done{false};
  // sanity checks
  assert( shared.buf_.size() == size );
  assert( junks.size() == size );

  // run all of the mechanism from within a threads
  Thread<RandReader> rReader{shared, done};
  Thread<RandOpts>   rOpts{shared, done};
  // force threads to initialize
  rReader.waitUntilReady();
  rOpts.waitUntilReady();

  // output data proper number of times
  for(size_t i=0; i<count; ++i)
  {
    // get the current buffer's content
    {
      SharedBuffer::Lock lock{shared.m_};
      junks.swap(shared.buf_);
    }
    // signal threads to compute next data part
    rReader.trigger();
    rOpts.trigger();
    // output caputred data
    cout.write( toChar(&junks[0]), junks.size() );
  }

  // note: threads will join automatically
  return 0;
}
