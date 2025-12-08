#pragma once
#include "config.hpp"
#include "Watchdog.hpp"
#include "step2brightness.hpp"
#include <util/delay.h>
#include <math.h>

// using PB0

namespace LED
{

// PB0
struct Port
{
  static constexpr auto b = _BV(0);

  static void init() { DDRB  |=  b; }
  static void on()   { PORTB |=  b; }
  static void off()  { PORTB &= ~b; }
};


struct SwPWM
{
  SwPWM() { Port::init(); }

  // 0..100 %
  void duty(uint8_t const d) { duty_ = ( d > 100u ? 100u : d); }

  // cycle is a little over 10ms (~10.5ms)
  void one_cycle()
  {
    static_assert( c_cycle_ms == 10u, "changing this constant requires adjusting the algorithm below" );
    uint8_t n = 0;
    if(duty_ > 0)
    {
      Port::on();
      for(; n < duty_; ++n)
        _delay_ms(0.1);
    }
    Port::off();
    for(; n < 100u; ++n)
      _delay_ms(0.1);
  }

private:
  uint8_t duty_{0};
};


struct State
{
  State() { Port::init(); }
  void enable_fade_in()  { step_preset_ = c_gamma_steps; }
  void enable_fade_out() { step_preset_ = 0; }

  auto stable() const { return step_current_ == step_preset_; }

  // ~10ms - same as SwPWM::one_cycle() + a bit extra for gamma calculations
  void one_cycle()
  {
    Watchdog::reset();
    compute_current_cycle();
    pwm.duty( duty() );
    pwm.one_cycle();
  }

private:
  void compute_current_cycle()
  {
    if(stable())
      return;

    if(cycles_left_in_current_step_ > 0u)
    {
      --cycles_left_in_current_step_;
      return;
    }

    if(step_current_ < step_preset_)
      ++step_current_;
    else
      --step_current_;
    cycles_left_in_current_step_ = c_cycles_per_fade_step;
  }

  uint8_t duty() const
  {
    // ATTiny2313 does not have enough space for floating point code and GCC version used here
    // does not have compile-time power function. therefor LUT has been generated with a helper script:
    //
    //   ./precompute_gamma_correction_LUT
    //
    switch(step_current_)
    {
      case 0:  return static_cast<uint8_t>(0.0);
      case 1:  return static_cast<uint8_t>(2.0354526576845218);
      case 2:  return static_cast<uint8_t>(5.011872336272723);
      case 3:  return static_cast<uint8_t>(8.490213995805885);
      case 4:  return static_cast<uint8_t>(12.340677254400193);
      case 5:  return static_cast<uint8_t>(16.493848884661176);
      case 6:  return static_cast<uint8_t>(20.905359058078467);
      case 7:  return static_cast<uint8_t>(25.54397365718448);
      case 8:  return static_cast<uint8_t>(30.386311717294955);
      case 9:  return static_cast<uint8_t>(35.4141047802992);
      case 10: return static_cast<uint8_t>(40.612619817811776);
      case 11: return static_cast<uint8_t>(45.96968166747838);
      case 12: return static_cast<uint8_t>(51.47503202664569);
      case 13: return static_cast<uint8_t>(57.11989016043459);
      case 14: return static_cast<uint8_t>(62.896640925344784);
      case 15: return static_cast<uint8_t>(68.79860659818013);
      case 16: return static_cast<uint8_t>(74.81987582580972);
      case 17: return static_cast<uint8_t>(80.95517266928725);
      case 18: return static_cast<uint8_t>(87.1997545077537);
      case 19: return static_cast<uint8_t>(93.54933117266962);
      case 20: return static_cast<uint8_t>(100.0);
    }
    return 0; // this should never happen
  }

  static constexpr uint8_t gamma_steps{100u / 20u};
  uint8_t step_current_{0};
  uint8_t step_preset_{0};
  uint8_t cycles_left_in_current_step_{0};
  SwPWM pwm;
};

}
