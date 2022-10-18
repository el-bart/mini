#pragma once
#include "config.hpp"
#include <avr/wdt.h>

struct Watchdog
{
  Watchdog() { enable(); }
  void enable() { wdt_enable(WDTO_500MS); }
  void reset() { wdt_reset(); }
};
