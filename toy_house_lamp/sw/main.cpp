#include "config.hpp"       // this file must be included as first one!
#include "Watchdog.hpp"
#include <util/delay.h>
#include "LED.hpp"


namespace
{
}


int main(void)
{
  //Watchdog::init();
  LED::State led;

  while(true)
  {
    // PoC
    LED::Port::on();
    _delay_ms(500);
    LED::Port::off();
    _delay_ms(500);
  }
}
