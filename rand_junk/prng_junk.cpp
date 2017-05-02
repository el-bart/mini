// pseudo random junk generator, with a pre-diefined seed.
// it is not that fast, but offers repeatable, low-quality psudo-randomness.
#include <random>
#include <iostream>
#include <boost/lexical_cast.hpp>

using std::cout;
using std::cerr;
using std::endl;

int main(int argc, char** argv)
{
  if(argc != 1+2)
  {
    cerr << argv[0] << " <seed> <size_in_bytes>" << endl;
    return 2;
  }
  const auto seed = boost::lexical_cast<uint32_t>(argv[1]);
  const auto requestedBytes = boost::lexical_cast<uint64_t>(argv[2]);

  std::mt19937_64 gen{seed};
  std::uniform_int_distribution<uint8_t> dist(0, 255);

  constexpr auto blockSize = 1024u*1024u;
  char buf[blockSize];
  uint64_t written = 0;

  while(written < requestedBytes)
  {
    for(auto& b: buf)
      b = dist(gen);
    const auto bytesLeft = requestedBytes - written;
    const auto writeSize = std::min<uint64_t>(blockSize, bytesLeft);
    cout.write(buf, writeSize);
    cout.flush();
    written += writeSize;
  }
}
