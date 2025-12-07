#pragma once
#include "config.hpp"

// BUT_FWD:   PD6
// BUT_BCK:   PB4
// BUT_LEFT:  PD4
// BUT_RIGHT: PD5

// BUT_START: PA0


namespace Buttons
{

inline void init()
{
  DDRA  &= ~_BV(0);
  PORTA |=  _BV(0);

  DDRB  &= ~_BV(4);
  PORTB |=  _BV(4);

  DDRD  &= ~( _BV(4) | _BV(5) | _BV(6) );
  PORTD |=    _BV(4) | _BV(5) | _BV(6);
}


inline bool forward_pressed()  { return not (PIND & _BV(6)); }
inline bool backward_pressed() { return not (PINB & _BV(4)); }
inline bool left_pressed()     { return not (PIND & _BV(4)); }
inline bool right_pressed()    { return not (PIND & _BV(5)); }
inline bool start_pressed()    { return not (PINA & _BV(0)); }

inline bool any_pressed()
{
  return forward_pressed()  ||
         backward_pressed() ||
         left_pressed()     ||
         right_pressed()    ||
         start_pressed();
}

}
