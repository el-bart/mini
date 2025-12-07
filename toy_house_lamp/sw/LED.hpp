#pragma once
#include "config.hpp"
#include <util/delay.h>

// using PB0

namespace LED
{

namespace detail
{
struct Port
{
  static constexpr auto b = _BV(0);

  static void init()   { DDRD |=  b; }
  static void set()   { PORTD |=  b; }
  static void clear() { PORTD &= ~b; }
};
}


struct LED
{
  LED() { P::init(); }
  void enable_fade_in()  { preset_ = 0x0000u; }
  void enable_fade_out() { preset_ = 0xFFFFu; }

  void updte()
  {
    if(current_ == preset_)
      return;
  }

private:
  using P = detail::Port;

  uint16_t current_{0};
  uint16_t preset_{0};
};

}
