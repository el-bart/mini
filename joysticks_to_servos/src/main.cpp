#include "config.hpp"
#include "Servo.hpp"
#include "pico/stdlib.h"

int main()
{
  stdio_init_all();

  auto const pin = 1;
  auto const delay = 2000;
  gpio_init(pin);
  gpio_set_dir(pin, GPIO_OUT);

  Servo s{2};

  for(uint8_t pos=0; true; ++pos)
  {
    s.pwm(pos);
    sleep_ms(20);
  }
}
