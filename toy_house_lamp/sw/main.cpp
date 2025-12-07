#include "config.hpp"       // this file must be included as first one!
#include "Watchdog.hpp"
#include <util/delay.h>
#include "LED.hpp"


int main(void)
{
  //Watchdog::init();
  LED::State state;

  while(true)
  {
    state.enable_fade_in();
    while(not state.stable())
      state.one_cycle();

    for(auto i=0; i<150; ++i)
      state.one_cycle();

    state.enable_fade_out();
    while(not state.stable())
      state.one_cycle();

    for(auto i=0; i<100; ++i)
      state.one_cycle();
  }
}
