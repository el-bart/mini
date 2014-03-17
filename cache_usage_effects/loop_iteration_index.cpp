/*
 * classic example showing how cache misses influence processing.
 *
 * when 2-dimensional array is accessed by iterating over rows in inner loop,
 * for big arrays, all cache reads are misses. when iterating inner loop over
 * columns on the other hand, most reads are hits (thanks to prefetching), and
 * so long memory access is amortized.
 *
 * code with proper indexing is usually about 10 times (1000%) faster then
 * reversed indexing.
 */
#include <iostream>
#include <string.h>

int main(void)
{
  int        res =0;
  const int  size=8*1024;
  char      *tab =new char[size*size];
  memset(tab, 0, size*size);

  for(int y=0; y<size; ++y)
    for(int x=0; x<size; ++x)
#if MAKE_OPT_VERSION
      // good indexing style
      res+=tab[y*size+x];
#else
      // bad indexing style
      res+=tab[x*size+y];
#endif

  return res%255+1;
}
