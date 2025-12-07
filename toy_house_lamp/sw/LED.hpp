#pragma once
#include "config.hpp"
#include <util/delay.h>

// using PB0

namespace LED
{

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
  void enable_fade_in()  { preset_ = 0x0000u; }
  void enable_fade_out() { preset_ = 0xFFFFu; }

  void updte()
  {
    if(current_ == preset_)
      return;
  }

private:

  uint16_t current_{0};
  uint16_t preset_{0};
};

}
