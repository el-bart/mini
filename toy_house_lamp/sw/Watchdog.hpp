#pragma once
#include "config.hpp"
#include <avr/wdt.h>

namespace Watchdog
{

inline void init() { wdt_enable(WDTO_8S); }
inline void disable() { wdt_disable(); }
inline void reset() { wdt_reset(); }

}
