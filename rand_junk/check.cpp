/*
 * check.cpp
 *
 * check what is the randomness of a given stream (byte distribution).
 *
 * downloaded from http://www.baszerr.eu
 */
#include <iostream>
#include <iomanip>

using namespace std;


int main(void)
{
  size_t cnt[256]={0};

  while(true)
  {
    char c;
    cin.get(c);
    if(cin.eof())
      break;
    ++cnt[(unsigned char)c];
  }

  constexpr int cols=1;
  for(int r=0; r<256/cols; r++)
  {
    cout<<setiosflags(ios::right)<<setfill(' ');
    for(int c=0; c<cols; ++c)
    {
      const int pos=r*cols+c;
      cout<<setw(3)<<pos<<": "<<setw(5)<<cnt[pos]<<"  ";
    }
    cout<<endl;
  }


  return 0;
}
