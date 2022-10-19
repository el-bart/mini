#include "Core.hpp"

int main(void)
{
  _delay_ms(500);   // give step-up a sec to build up steady voltage
  Core c;
  c.run<
    'h','e','l','l','o',
    ' ',
    'h','u','m','a','n','s',
    ' ',
    'o','f',
    ' ',
    't','h','e',
    ' ',
    'p','l','a','n','e','t',
    ' ',
    'e','a','r','t','h'
  >();
}
