#include <Arduino.h>
#include <avr/wdt.h>

auto constexpr pin_adc = A7;
auto constexpr pin_pwm = A3;


void setup()
{
  {
    wdt_disable();
    wdt_enable(WDTO_1S);
  }

  pinMode(pin_adc, INPUT);
  pinMode(pin_pwm, INPUT);

  Serial.begin(115200);     // RX == 0, TX == 1
  Serial.write("PWM light ctrl booted\n");
}


void loop()
{
  auto in = analogRead(pin_adc);
  auto s = in / 4;
  Serial.print("read: ");
  Serial.print(in, DEC);
  Serial.print(" scaled: ");
  Serial.print(s, DEC);
  Serial.print("\n");
  analogWrite(s);
  wdt_reset();
  delay(200);
}
