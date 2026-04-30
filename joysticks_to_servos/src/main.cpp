#include "Servo.hpp"
#include "pico/stdlib.h"
#include <array>

int main()
{
  stdio_init_all();

  // note: pin pairs: 2-3, 4-5, 6-7 - share the same slice
  std::array<Servo, 6> servos{
    Servo{2}, Servo{3},
    Servo{4}, Servo{5},
    Servo{6}, Servo{7},
  };

  for(uint8_t p=0; true; ++p)
  {
    for(auto& s: servos)
      s.pos(p);
    sleep_ms(20);
  }
}
