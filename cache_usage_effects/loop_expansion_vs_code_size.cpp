/*
 * this example shows influence of loop expansions on execution time.
 *
 * longer code, without jumps takes more space in cache causing more often
 * cache misses. since CPU is much faster then memory loop iteration is,
 * from some point, faster than too-much exapnded code.
 *
 * loop in this case is about 5% faster than it's expansion. noticable is
 * also fact, that expanded loop binary is 25 times (2500%) bigger than
 * code with simple loop.
 */
#include <cmath>

// NOTE: compile with: g++ -O3 -Wall -ftemplate-depth-5000

inline int myOp(const int x)
{
  return x/2.13 + round(x+232.21) - floor(x+1) + log(x);
}

template<int N>
struct A
{
  inline static void f(const int seed, int &ret)
  {
    ret+=myOp(seed*N);
    A<N-1>::f(seed, ret);
  }
};

template<>
struct A<0>
{
  inline static void f(const int, int &)
  {
  }
};


int main(int argc, char **argv)
{
  int       ret  =0;

  const int cnt  =10*1000;
  const int inner=5000;

#if MAKE_OPT_VERSION
  // no epxlicit loop expansion - small code is better (fits in cache)
  for(int i=0; i<cnt; ++i)
  {
    const int seed=argc+i;
    for(int j=inner; j>0; --j)
      ret += myOp(seed*j);
  }
#else
  // manual loop expansion in compile-time - big code slows down a little
  for(int i=0; i<cnt; ++i)
    A<inner>::f(argc+i, ret);
#endif

  return ret%255+1;
}
