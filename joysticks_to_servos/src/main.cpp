#include "config.hpp"
#include "Servo.hpp"
#include "pico/stdlib.h"

int main()
{
  stdio_init_all();

  Servo s{2};
  Servo s3{3};

  s3.pos(255/2);

  for(uint8_t p=0; true; ++p)
  {
    s.pos(p);
    sleep_ms(20);
  }
}
