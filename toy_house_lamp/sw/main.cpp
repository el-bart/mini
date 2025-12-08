#include "config.hpp"       // this file must be included as first one!
#include "Watchdog.hpp"
#include "LED.hpp"
#include "PRNG.hpp"

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


inline void run(LED::State& state, PRNG& prng)
{
  auto countdown_to_PRNG_cycle_save = c_cycles_per_PRNG_state_save;

  while(true)
  {
    auto const on_s  = 3u + prng.random() % 72u;
    auto const off_s = 1u + prng.random() % 8u;
    cycle(state, on_s, off_s);

    --countdown_to_PRNG_cycle_save;
    if(countdown_to_PRNG_cycle_save == 0)
    {
      prng.save_entropy();
      countdown_to_PRNG_cycle_save = c_cycles_per_PRNG_state_save;
    }
  }
}

}


int main(void)
{
  Watchdog::init();
  PRNG prng;
  LED::State state;
  run(state, prng);
}
