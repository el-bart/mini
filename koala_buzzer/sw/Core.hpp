#pragma once
#include "config.hpp"
#include <util/delay.h>

#include "Led.hpp"
#include "Watchdog.hpp"


struct Core
{
  Core() { led_.off(); }

  template<char ...Text>
  inline void run()
  {
    while(true)
      send_text<Text..., '\0'>();
  }

private:
  template<char Head, char ...Tail>
  inline void send_text()
  {
    wdg_.reset();
    send_char<Head>();
    inter_letter_pause();
    send_text<Tail...>();
  }

  template<char c>
  void send_char();

  void dash(uint8_t n=1)
  {
    for(uint8_t i=0; i<n; ++i)
    {
      wdg_.reset();
      led_.on();
      wait_units(3);
      led_.off();
      wdg_.reset();
      inter_unit_pause();
    }
  }

  void dot(uint8_t n=1)
  {
    for(uint8_t i=0; i<n; ++i)
    {
      wdg_.reset();
      led_.on();
      wait_units(1);
      led_.off();
      wdg_.reset();
      inter_unit_pause();
    }
  }

  void inter_unit_pause()   { wait_units(1); wdg_.reset(); }
  void inter_letter_pause() { wait_units(3); wdg_.reset(); }
  void inter_word_pause()   { wait_units(7); wdg_.reset(); }

  inline void end_of_text_pause()
  {
    for(uint8_t i=0; i<3; ++i)
    {
      wdg_.reset();
      inter_word_pause();
    }
  }

  void wait_units(uint8_t n)
  {
    for(uint8_t i=0u; i<n; ++i)
    {
      wdg_.reset();
      _delay_ms(100);   // wikipedia suggest 50ms, but it looks too fast on LED
      wdg_.reset();
    }
  }

  Watchdog wdg_;
  Led led_;
};


template<> INLINE_MORSE_TABLE void Core::send_char<'a'>() { dot(); dash(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'b'>() { dash(); dot(3); }
template<> INLINE_MORSE_TABLE void Core::send_char<'c'>() { dash(); dot(); dash(); dot(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'d'>() { dash(); dot(2); }
template<> INLINE_MORSE_TABLE void Core::send_char<'e'>() { dot(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'f'>() { dot(2); dash(); dot(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'g'>() { dash(2); dot(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'h'>() { dot(4); }
template<> INLINE_MORSE_TABLE void Core::send_char<'i'>() { dot(2); }
template<> INLINE_MORSE_TABLE void Core::send_char<'j'>() { dot(); dash(3); }
template<> INLINE_MORSE_TABLE void Core::send_char<'k'>() { dash(); dot(); dash(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'l'>() { dot(); dash(); dot(2); }
template<> INLINE_MORSE_TABLE void Core::send_char<'m'>() { dash(2); }
template<> INLINE_MORSE_TABLE void Core::send_char<'n'>() { dash(); dot(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'o'>() { dash(3); }
template<> INLINE_MORSE_TABLE void Core::send_char<'p'>() { dot(); dash(2); dot(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'q'>() { dash(2); dot(); dash(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'r'>() { dot(); dash(); dot(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'s'>() { dot(3); }
template<> INLINE_MORSE_TABLE void Core::send_char<'t'>() { dash(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'u'>() { dot(2); dash(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'v'>() { dot(3); dash(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'w'>() { dot(); dash(2); }
template<> INLINE_MORSE_TABLE void Core::send_char<'x'>() { dash(); dot(2); dash(); }
template<> INLINE_MORSE_TABLE void Core::send_char<'y'>() { dash(); dot(); dash(2); }
template<> INLINE_MORSE_TABLE void Core::send_char<'z'>() { dash(2); dot(2); }

template<> INLINE_MORSE_TABLE void Core::send_char<'1'>() { dot(1); dash(4); }
template<> INLINE_MORSE_TABLE void Core::send_char<'2'>() { dot(2); dash(3); }
template<> INLINE_MORSE_TABLE void Core::send_char<'3'>() { dot(3); dash(2); }
template<> INLINE_MORSE_TABLE void Core::send_char<'4'>() { dot(4); dash(1); }
template<> INLINE_MORSE_TABLE void Core::send_char<'5'>() { dot(5); dash(0); }
template<> INLINE_MORSE_TABLE void Core::send_char<'6'>() { dash(1); dot(4); }
template<> INLINE_MORSE_TABLE void Core::send_char<'7'>() { dash(2); dot(3); }
template<> INLINE_MORSE_TABLE void Core::send_char<'8'>() { dash(3); dot(2); }
template<> INLINE_MORSE_TABLE void Core::send_char<'9'>() { dash(4); dot(1); }
template<> INLINE_MORSE_TABLE void Core::send_char<'0'>() { dash(5); dot(0); }

template<> INLINE_MORSE_TABLE void Core::send_char<' '>() { inter_word_pause(); }

template<>
inline void Core::send_text<'\0'>()
{
  end_of_text_pause();
}
