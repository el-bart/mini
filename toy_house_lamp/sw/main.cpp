#include "config.hpp"       // this file must be included as first one!
#include "Watchdog.hpp"
#include <util/delay.h>
#include "Direction.hpp"
#include "PowerCtrl.hpp"
#include "read_program.hpp"
#include "execute_program.hpp"


namespace
{

inline void start_delay()
{
  for(auto i=0; i<5; ++i)
  {
    _delay_ms(100);
    Watchdog::reset();
  }
}

}


int main(void)
{
  PowerCtrl::init();
  Buttons::init();
  Watchdog::init();

  Direction dirs[30];

  while(true)
  {
    Watchdog::reset();
    if( not read_program(dirs) )
      PowerCtrl::power_off();
    start_delay();
    execute_program(dirs);
  }
}
