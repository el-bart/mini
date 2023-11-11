#include <Arduino.h>
#include <avr/wdt.h>
#include <math.h>

auto constexpr pin_adc = A7;
auto constexpr pin_pwm = 3;


void setup()
{
  {
    wdt_disable();
    wdt_enable(WDTO_1S);
  }

  pinMode(pin_adc, INPUT);
  pinMode(pin_pwm, OUTPUT);

  Serial.begin(115200);     // RX == 0, TX == 1
  Serial.write("PWM light ctrl booted\n");
}


namespace
{
uint8_t gamma(uint16_t in, double gamma)
{
  double v = in / 1023.0;
  double out = pow(v, gamma);
  return static_cast<uint8_t>(out * 255);
}

uint8_t clamp(uint8_t min, uint8_t value, uint8_t max)
{
  if(value < min)
    return min;
  if(max < value)
    return max;
  return value;
}
}

void loop()
{
  auto in = analogRead(pin_adc);
  auto gcs = gamma(in, 1.3);
  auto cgcs = clamp(5, gcs, 255);
  analogWrite(pin_pwm, cgcs);

  Serial.print("read: ");
  Serial.print(in, DEC);
  Serial.print(" gamma: ");
  Serial.print(cgcs, DEC);
  Serial.print("\n");

  wdt_reset();
  delay(100);
}
