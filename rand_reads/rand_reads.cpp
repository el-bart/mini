/*
 * rand_reads.cpp
 *
 */
#include <memory>
#include <vector>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <algorithm>
#include <stdexcept>
#include <ctime>
#include <cassert>
#include <boost/lexical_cast.hpp>

#include "ClockTimer.hpp"

using namespace std;

typedef vector<size_t> Offsets;


size_t getFileSize(fstream &file)
{
  const size_t cur=file.tellp();
  file.seekp(0, fstream::end);
  const size_t end=file.tellp();
  file.seekp(cur);
  return end;
} // getFileSize()


int main(int argc, const char **argv)
{
  if(argc!=1+2)
  {
    cerr<<argv[0]<<" <blk_size_in_kB> <file>"<<endl;
    return 42;
  }

  // init basic variables
  constexpr size_t kb       =1024;
  constexpr size_t mb       =1024*kb;
  const size_t     blockSize=boost::lexical_cast<size_t>(argv[1]) * kb;

  // open file
  fstream file{argv[2]};
  if( !file.is_open() )
    throw std::runtime_error{"cannot open file"};
  file.exceptions( fstream::failbit | fstream::badbit | fstream::eofbit );

  // prepare random elements order
  Offsets      off;
  const size_t fileSize=getFileSize(file);
  off.reserve(fileSize/blockSize+1);
  for(size_t now=0; now+blockSize<=fileSize; now+=blockSize)
    off.push_back(now);
  random_shuffle(off.begin(), off.end());

  // read whole file in random order
  unique_ptr<char[]> buf{new char[blockSize]};
  unsigned long long res        =0;
  size_t             bytesRead  =0;
  time_t             lastDisplay=time(NULL);
  const ClockTimer   timer;
  for(Offsets::const_iterator it=off.begin(); it!=off.end(); ++it)
  {
    // read next, random block
    file.seekg(*it);
    file.read(buf.get(), blockSize);
    // add it to the result
    for(const char *byte=buf.get(); byte!=buf.get()+blockSize; ++byte)
      res+=*byte;
    // display summary once a while
    bytesRead+=blockSize;
    const time_t now=time(NULL);
    if( (now-lastDisplay)>2 )
    {
      const double pd=double{bytesRead}/fileSize*100;
      cerr<<fixed<<setprecision(1)<<pd<<"% done..."<<endl;
      lastDisplay=now;
    }
  }
  const double dt=timer.elapsed();

  // display summary
  cout<<"done random reading of "<<fileSize/mb<<"[MB] file with "<<blockSize/kb<<"[kB] blocks"<<endl;
  cout<<"total number of "<<off.size()<<" reads were done"<<endl;
  cout<<"total operation time was "<<dt<<"[s]"<<endl;
  cout<<"sum of bytes is "<<res<<endl;
  cout<<"average speed is "<<(fileSize/dt)/mb<<"[MB/s]"<<endl;

  return 0;
}
