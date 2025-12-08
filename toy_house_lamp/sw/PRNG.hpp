#pragma once
#include "config.hpp"
#include "EEPROM.hpp"
#include <stdlib.h>

struct PRNG
{
  PRNG()
  {
    uint16_t seed = 0;
    for(auto addr=0; addr<EEPROM::size; ++addr)
      seed += EEPROM::read(addr);
    srand(seed);
    last_addr_ = random() % EEPROM::size;
  }

  uint8_t random() const { return rand(); }

  void save_entropy()
  {
    ++last_addr_;
    if(last_addr_ > EEPROM::size)
      last_addr_ = 0;
    EEPROM::write(last_addr_, random());
  }

private:
  uint8_t last_addr_{0};
};
