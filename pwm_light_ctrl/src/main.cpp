#include <Arduino.h>
#include <avr/wdt.h>

auto constexpr pin_adc = A7;


void setup()
{
  {
    wdt_disable();
    wdt_enable(WDTO_1S);
  }
  pinMode(pin_adc, INPUT);
  Serial.begin(115200);     // RX == 0, TX == 1
  Serial.write("PWM light ctrl booted\n");
}


void loop()
{
  auto s = analogRead(pin_adc);
  Serial.print("read: ");
  Serial.print(s, DEC);
  Serial.print("\n");
  wdt_reset();
  delay(200);
}