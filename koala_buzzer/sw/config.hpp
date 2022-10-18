#pragma once
#include <inttypes.h>
#include <avr/io.h>

constexpr uint32_t kHz=1000ul;
constexpr uint32_t MHz=1000ul * kHz;
constexpr uint32_t fcpu = (128u*kHz)/8u;
#define F_CPU fcpu

// controls if full morse code table shall be compiled in.
#if 0
  // uses ~350B of ROM, but printing each new character is just 6B.
  // preferred for longer texts.
  #define INLINE_MORSE_TABLE
#else
  // does not take up extra space, but each character can take some 20B.
  // preferred for shorter texts.
  #define INLINE_MORSE_TABLE inline
#endif
