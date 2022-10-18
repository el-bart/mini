#pragma once
#include <inttypes.h>

struct Buzzer
{
  Buzzer() { DDRB |= _BV(1); }
  void toggle() { PORTB ^=  _BV(1); }
  void on()     { PORTB |=  _BV(1); }
  void off()    { PORTB &= ~_BV(1); }
};
