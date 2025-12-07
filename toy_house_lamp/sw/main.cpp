#include "config.hpp"       // this file must be included as first one!
#include "Watchdog.hpp"
#include <util/delay.h>
#include "LED.hpp"

namespace
{

void hold(LED::State& state, uint8_t const s)
{
  for(uint8_t j=0u; j<s; ++j)
    for(uint8_t i=0; i<1000u/c_cycle_ms; ++i)
      state.one_cycle();
}


void reach(LED::State& state)
{
  while(not state.stable())
    state.one_cycle();
}


void cycle(LED::State& state, uint8_t on_s, uint8_t off_s)
{
  state.enable_fade_in();
  reach(state);
  hold(state, on_s);

  state.enable_fade_out();
  reach(state);
  hold(state, off_s);
}


inline void execute(LED::State& state)
{
  cycle(state, 4, 1);
  cycle(state, 16, 3);
  cycle(state, 11, 2);
  cycle(state, 21, 4);
  cycle(state, 42, 5);
  cycle(state, 17, 2);
}

}


int main(void)
{
  Watchdog::init();
  LED::State state;
  while(true)
    execute(state);
}
