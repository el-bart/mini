#pragma once
#include "config.hpp"
#include <inttypes.h>

struct Buzzer
{
  Buzzer()
  {
    // phase correct PWM
    TCCR0A |= _BV(WGM00);
    //TCCR0B |= _BV(WGM02);
    // 01 PWM
    TCCR0A |= _BV(COM0B1);
    // frequency ~1kHz
    OCR0B = 20;
    // output mode
    DDRB |= _BV(PB1);
  }

  void on()
  {
    TCCR0B |= _BV(CS00); // prescaler = 1
  }

  void off()
  {
    TCCR0B &= ~ ( _BV(CS02) | _BV(CS01) | _BV(CS00) );  // prescaler = 0 (i.e. stop clock)
  }
};
