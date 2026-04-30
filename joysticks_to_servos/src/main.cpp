#include "config.hpp"
#include "Servo.hpp"
#include "pico/stdlib.h"

int main()
{
  stdio_init_all();

  Servo s{2};

  for(uint8_t pos=0; true; ++pos)
  {
    s.pwm(pos);
    sleep_ms(20);
  }
}
