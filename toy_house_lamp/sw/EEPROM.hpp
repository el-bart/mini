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
    auto const byte = eeprom_read_byte( to_addr(addr) );
    Watchdog::reset();
    return byte;
  }

  static void write(uint8_t const addr, uint8_t const byte)
  {
    Watchdog::reset();
    wait_for_last_write_to_complete();
    eeprom_write_byte( to_addr(addr), byte);
    Watchdog::reset();
  }

private:
  static void wait_for_last_write_to_complete()
  {
     eeprom_busy_wait();
  }

  static uint8_t* to_addr(uint8_t const addr)
  {
    uint8_t* ptr = nullptr;
    ptr += addr;
    return ptr;
  }
};
