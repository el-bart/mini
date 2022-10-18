#pragma once
#include "config.hpp"
#include <inttypes.h>

struct Buzzer
{
  Buzzer()
  {
    // fast PWM mode
    TCCR0A |= _BV(WGM01) | _BV(WGM00);
    // 1->0 PWM's output compare
    TCCR0A |= _BV(COM0B1);
    // volume 0-255
    OCR0B = 2;
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
