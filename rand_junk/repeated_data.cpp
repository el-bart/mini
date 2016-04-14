#include <limits>
#include <string>
#include <random>
#include <iostream>
#include <boost/lexical_cast.hpp>
#include <cassert>

using namespace std;

string randomString(const size_t size)
{
  string        data(size, 0);
  random_device rd;
  mt19937_64    prng( rd() );
  using Byte = string::value_type;
  std::uniform_int_distribution<Byte> dist( numeric_limits<Byte>::min(), numeric_limits<Byte>::max() );
  for(auto& byte: data)
    byte = dist(prng);
  return data;
}


int main(int argc, const char **argv)
{
  if(argc!=2)
  {
    cerr<<argv[0]<<" <size_in_MB>"<<endl;
    return 42;
  }

  constexpr size_t mb   = 1024*1024;
  constexpr size_t size = 1*mb;
  const     size_t count=boost::lexical_cast<size_t>(argv[1]);

  const auto data = randomString(size);
  assert( data.size() == size );

  // output data proper number of times
  for(size_t i=0; i<count; ++i)
    cout.write( data.data(), data.size() );
}
