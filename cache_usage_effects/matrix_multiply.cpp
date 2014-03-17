/*
 * one more, less trivial example of data caching examples.
 *
 * when computing matrix pultiplying using equation directly from definition
 * wh do reversed indexing on second matrix. to prevent this code has been
 * slightly reorganized to ensure that as much accesses as possible will be
 * "local" (i.e. element laying nearby in the memory will be used most of the
 * cases).
 *
 * this code is around 5 times faster (500%) then naive implementation.
 */

int sum(double *m, const int n)
{
  int ret=0;
  for(int i=0; i<n; ++i)
    for(int j=0; j<n; ++j)
      ret+=m[i*n+j];
  return ret;
}

void fill(double *m, const int n, const double e)
{
  for(int i=0; i<n; ++i)
    for(int j=0; j<n; ++j)
      m[i*n+j]=e+i-j;
}


int main(void)
{
  const int n=512;
  double    i1 [n][n];
  double    i2 [n][n];
  double    out[n][n];

  fill(i1 [0], n, 3.14);
  fill(i2 [0], n, 2.72);
  fill(out[0], n,    0);        // for summing

#if MAKE_OPT_VERSION
  // optimized
  for(int y=0; y<n; ++y)
    for(int i=0; i<n; ++i)
      for(int j=0; j<n; ++j)
        out[y][j] += i1[y][i] * i2[i][j];
#else
  // normal
  for(int y=0; y<n; ++y)
    for(int x=0; x<n; ++x)
      for(int i=0; i<n; ++i)
        out[y][x] += i1[y][i] * i2[i][x];
#endif

  const int ret=sum(out[0], n);
  return ret%255+1;
}
