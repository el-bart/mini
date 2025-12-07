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
  LED::SwPWM pwm;

  pwm.set(50);
  while(true)
  {
    pwm.one_cycle();
  }

  while(true)
  {
    // PoC
    LED::Port::on();
    _delay_ms(500);
    LED::Port::off();
    _delay_ms(500);
  }
}
