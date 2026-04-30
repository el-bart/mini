#include "ADC.hpp"
#include "Servo.hpp"
#include "pico/stdlib.h"
#include <array>

auto constexpr pin_joystick_0_switch = 15;
auto constexpr pin_joystick_1_switch = 14;

void init_switches()
{
  for(auto pin: { pin_joystick_0_switch, pin_joystick_1_switch })
  {
    gpio_init(pin);
    gpio_set_dir(pin, GPIO_IN);
  }
}

bool pressed(int const button_pin)
{
  return gpio_get(button_pin) == false;
}


int main()
{
  stdio_init_all();

  init_switches();

  // note: pin pairs: 2-3, 4-5, 6-7 - share the same slice
  std::array<Servo, 6> servos{
    Servo{2}, Servo{3},
    Servo{4}, Servo{5},
    Servo{6}, Servo{7},
  };

  std::array<ADC, 4> adcs{
    ADC{ADC::Port::ADC0},   // joystick left:  OX
    ADC{ADC::Port::ADC1},   // joystick left:  OY
    ADC{ADC::Port::ADC2},   // joystick right: OX
    ADC{ADC::Port::ADC3},   // joystick right: OX
  };

  // maps from servo number, to ADC it uses
  std::array<unsigned, servos.size()> servo2adc{ 0, 1, 2, 3, 3, 3 };

  while(true)
  {
    std::array<float, adcs.size()> reads;
    for(auto i=0u; i<adcs.size(); ++i)
      reads[i] = adcs[i].read();
  }

  for(uint8_t p=0; true; ++p)
  {
    for(auto& s: servos)
      s.pos(p);
    sleep_ms(20);
  }
}
