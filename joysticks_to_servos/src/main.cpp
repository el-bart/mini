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

uint8_t volt2pos(float const v)
{
  auto constexpr conv_fact = 255.0f * ( 1.0f / 3.3f );
  return static_cast<uint8_t>(v * conv_fact);
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

  std::array<ADC, 4> const adcs{
    ADC{ADC::Port::ADC0},   // joystick left:  OX
    ADC{ADC::Port::ADC1},   // joystick left:  OY
    ADC{ADC::Port::ADC2},   // joystick right: OX
    ADC{ADC::Port::ADC3},   // joystick right: OX
  };

  // maps from servo number, to ADC it uses
  std::array<unsigned, servos.size()> const servo2adc{ 0, 1, 2, 3, 3, 3 };

  while(true)
  {
    std::array<uint8_t, adcs.size()> pos;
    for(auto i=0u; i<adcs.size(); ++i)
      pos[i] = volt2pos( adcs[i].read() );

    for(auto i=0u; i<servos.size(); ++i)
    {
      auto const adc_i = servo2adc[i];
      servos[i].pos( pos[adc_i] );
    }

    sleep_ms(20);
  }
}
