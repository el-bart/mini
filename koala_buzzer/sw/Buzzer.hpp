#pragma once
#include "config.hpp"
#include <inttypes.h>

struct Buzzer
{
  Buzzer()
  {
    // normal mode
    TCCR0A |= 0u;
    // clear on compare
    TCCR0A |= _BV(COM0B0);
    //TCCR0B |= _BV(WGM02);
    // volume 0-255
    OCR0B = 100;
    // output mode
    DDRB |= _BV(PB1);
  }

  void on()
  {
    // ~586 [Hz]
    TCCR0B |= _BV(CS01); // prescaler = 8
  }

  void off()
  {
    TCCR0B &= ~ ( _BV(CS02) | _BV(CS01) | _BV(CS00) );  // prescaler = 0 (i.e. stop clock)
  }
};
