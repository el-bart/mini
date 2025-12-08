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
  inline void enable_fade_in()  { step_preset_ = c_gamma_steps; }
  inline void enable_fade_out() { step_preset_ = 0; }

  inline auto stable() const { return step_current_ == step_preset_; }

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

  inline uint8_t duty() const
  {
    // ATTiny2313 does not have enough space for floating point code and GCC version used here
    // does not have compile-time power function. therefor LUT has been generated with a helper script:
    //
    //   ./precompute_gamma_correction_LUT
    //
    return step2brightness(step_current_);
  }

  static constexpr uint8_t gamma_steps{100u / 20u};
  uint8_t step_current_{0};
  uint8_t step_preset_{0};
  uint8_t cycles_left_in_current_step_{0};
  SwPWM pwm;
};

}
