/*
 * shows influence of code flow interruptions by conditional jumps. the case here is
 * common disscussion about using only one exit point from function or exit just after
 * error has been encountered.
 *
 * when long jums have to be taken, code flow is broken and L1i cache has to be loaded
 * with new instructions which costs time. good branch prediction amortizes this
 * cost though.
 *
 * both cases usually execute in simillar time, though on some machines exisitng
 * imieadatly yelds better results (about 2%).
 */
#include <stdlib.h>
#include <cassert>

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
  if(n<=0)
    return 0;
  if(data==NULL)
    return 0;

  return doSth(data, n) + doSth(data, n-1);   // long code
#else
  // non-optimal
  int ret=0;
  if(n>0)
    if(data!=NULL)
      ret=doSth(data, n) + doSth(data, n-1);  // long code
  return ret;
#endif
}


int main(void)
{
  int       ret=0;
  const int n  =512;
  int       data[n];

  for(int i=0; i<100*1000*1000; ++i)
    ret+=myFunc( ((i%3)?data:NULL),     // 1/3 calls will pass NULL pointer
                 ((i%4)?n:0)        );  // 1/4 calls will pass invalid size

  return ret%255+1;
}
