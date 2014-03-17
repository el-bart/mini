/*
 * example showing padding for speeding up memory access.
 *
 * whan creating structure, one may force compiler to discard any padding. it
 * makes structure smaller (here - on x86-64 and gcc-4.3.4 almost 40%, though
 * one must notice that structure is made in specific way, to ensure high
 * padding) but it requires additional computational time to process its values.
 * key of this part is to show that these extra instructions cost more than
 * additional cache operations for alligned structures.
 *
 * this code is around 30% slower when using non-padded structures.
 */
#include <stdio.h>
#include <string.h>

struct A
{
  char a1;
  int  a2;

  char b1;
  int  b2;

  char c1;
  int  c2;
}
#if MAKE_OPT_VERSION
  // optimized (for speed)
#else
  // optimized (for size)
  __attribute__((packed))
#endif
;


int main(void)
{
  printf("structure size is %ld[B]\n", sizeof(A) );

  int ret=0;
  const int size=10*1000;
  A   tab[size];

  // some predictible initial content
  memset(tab, 1, sizeof(tab) );

  for(int i=0; i<50*1000; ++i)
    for(int j=0; j<size; ++j)
    {
      ret += tab[j].a1 + tab[j].a2;
      ret += tab[j].b1 + tab[j].b2;
      ret += tab[j].c1 + tab[j].c2;

      tab[j].a1 += ret + i%100;
      tab[j].a2 += ret + i%101;
      tab[j].b1 += ret + i%102;
      tab[j].b2 += ret + i%103;
      tab[j].c1 += ret + i%104;
      tab[j].c2 += ret + i%105;
    }

  return ret%255+1;
}
