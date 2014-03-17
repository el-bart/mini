/*
 * shows influence of data layout in memory vs. prefetching.
 *
 * when data structure is big, it is prefetched by CPU, even though only its
 * small part is needed (here: index). this polutes caches with data not used
 * even once. this can be prevented by keeping unrelated data apart from those
 * that are likely to be used.
 *
 * in this case separating data from index speeds program up about 5 times
 * (500%) on task simillar to searching structure by index.
 */
#include <boost/scoped_array.hpp>

using namespace std;
using namespace boost;


struct Big
{
  char data_[1024];
};

int               g_id =-1;
const int         g_cnt=50*1000;
scoped_array<Big> g_big( new Big[g_cnt] );


#if MAKE_OPT_VERSION

struct Common
{
  Common(void):
    id_(++g_id),
    b_( &g_big[id_] )
  {
  }

  int  id_;
  Big *b_;
};

#else

struct Common
{
  Common(void):
    id_(++g_id)
  {
  }

  int id_;
  Big b_;
};

#endif


int main(int argc, char **argv)
{
  int                  ret=0;
  scoped_array<Common> tab( new Common[g_cnt] );

  for(int j=0; j<1000; ++j)
    for(int i=0; i<g_cnt; ++i)
      ret+=tab[i].id_+j;

  // just to be sure 2nd tab is not removed, when not used in Common
  ret+=g_big[g_cnt-1].data_[0];

  return ret%255+1;
}
