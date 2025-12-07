#pragma once
#include "config.hpp"
#include "Watchdog.hpp"

// power-on: PA1

namespace PowerCtrl
{

namespace detail
{
inline void pin_power_on()   { PORTA |=  _BV(1); }
inline void pin_power_off()  { PORTA &= ~_BV(1); }
}

inline void init()
{
  DDRA |= _BV(1);
  detail::pin_power_on();
}

inline void power_off()
{
  detail::pin_power_off();
  while(true)
    Watchdog::reset();
}

}
