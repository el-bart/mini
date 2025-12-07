#pragma once
#include "config.hpp"
#include <util/delay.h>

// LEFT  SEQ: PD0 PD2 PD1 PD3
// RIGHT SEQ: PB0 PB2 PB1 PB3
// min  - 15[ms] per step!
// good - 30[ms] per step!

namespace Engines
{

struct PortB
{
  static void init_bits(uint8_t b)   { DDRB |=  b; }
  static void set_bits(uint8_t b)   { PORTB |=  b; }
  static void clear_bits(uint8_t b) { PORTB &= ~b; }
};


struct PortD
{
  static void init_bits(uint8_t b)   { DDRD |=  b; }
  static void set_bits(uint8_t b)   { PORTD |=  b; }
  static void clear_bits(uint8_t b) { PORTD &= ~b; }
};


template<typename Port, uint8_t B0, uint8_t B1, uint8_t B2, uint8_t B3>
struct Generic
{
  Generic() { Port::init_bits( all_bits() ); }
  void off() { Port::clear_bits( all_bits() ); }
  void step_forward() { go_to_pos( next_pos() ); }
  void step_backward() { go_to_pos( prev_pos() ); }

private:
  static auto all_bits() { return B0 | B1 | B2 | B3; }

  void go_to_pos(uint8_t pos)
  {
    off();
    Port::set_bits( pos2bit(pos) );
    pos_ = pos;
  }

  uint8_t pos2bit(uint8_t pos) const
  {
    switch(pos)
    {
      case 0: return B0;
      case 1: return B1;
      case 2: return B2;
      case 3: return B3;
    }
    return 0xFF;    // should never reach here...
  }

  uint8_t next_pos() const
  {
    if(0 < pos_)
      return pos_ - 1;
    return 3;
  }

  uint8_t prev_pos() const
  {
    if(pos_ < 3)
      return pos_ + 1;
    return 0;
  }

  uint8_t pos_{0};
};


using Left  = Generic<PortD, _BV(3), _BV(1), _BV(2), _BV(0)>;
using Right = Generic<PortB, _BV(3), _BV(1), _BV(2), _BV(0)>;

}
