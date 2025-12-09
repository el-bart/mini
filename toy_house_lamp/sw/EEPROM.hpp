#pragma once
#include "config.hpp"
#include "Watchdog.hpp"
#include <avr/io.h>
#include <avr/eeprom.h>

struct EEPROM
{
  static constexpr uint8_t size = 128;

  static uint8_t read(uint8_t const addr)
  {
    Watchdog::reset();
    wait_for_last_write_to_complete();
    auto const byte = eeprom_read_byte((uint8_t*)uint16_t{addr});
    Watchdog::reset();
    return byte;
  }

  static void write(uint8_t const addr, uint8_t const byte)
  {
    Watchdog::reset();
    wait_for_last_write_to_complete();
    eeprom_write_byte((uint8_t*)uint16_t{addr}, byte);
    Watchdog::reset();
  }

private:
  static void wait_for_last_write_to_complete()
  {
     eeprom_busy_wait();
  }
};
