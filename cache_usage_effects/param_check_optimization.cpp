/*
 * example showing influence of polarized branching (i.e. most of the cases
 * only one path is choosen) and its optimization on code execution.
 *
 * when branches are known to pass/fail most of the times (i.e. error checking
 * is expected to happen less often then acctuall error situation), knowledge
 * of this can be used to bias compiler to generate code optimized for this
 * condition. longer code (doSth() inlined call) is used between branches to
 * make it more visible.
 *
 * optimized code is around 1-2% faster than non-optimized one.
 */
#include <stdlib.h>
#include <cassert>

#define UNLIKELY(expr) __builtin_expect(!!(expr), 0)
#define LIKELY(expr)   __builtin_expect(!!(expr), 1)

static inline int doSth(int *data, int n)
{
  // intentionaly long code

  const int min=20;
  int tmpData[min];
  if(data==NULL || n<=0)
  {
    data=tmpData;
    n   =min;
  }

  assert(n>=min);

  static int seed=42;
  int        i   =min;
  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;

  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;

  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;

  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;
  data[--i]=n-seed++;

  int ret=n;
  for(int j=0; j<min; ++j)
    ret+=data[i];

  return ret;
} __attribute__((always_inline))

int myFunc(int *data, const int n)
{
#if MAKE_OPT_VERSION
  // optimized
  if( UNLIKELY(n<=0) )
    return doSth(data, n-10);
  if( UNLIKELY(data==NULL) )
    return doSth(data, n-20);

  return doSth(data, n) + doSth(data, n-1);   // long code
#else
  // normal
  if(n<=0)
    return doSth(data, n-10);
  if(data==NULL)
    return doSth(data, n-20);

  return doSth(data, n) + doSth(data, n-1);   // long code
#endif
}


int main(void)
{
  int       ret=0;
  const int n  =512;
  int       data[n];

  for(int i=0; i<100*1000*1000; ++i)
    ret+=myFunc( ((i%300)?data:NULL),     // 1/300 calls will pass NULL pointer
                 ((i%400)?n:0)        );  // 1/400 calls will pass invalid size

  return ret%255+1;
}
