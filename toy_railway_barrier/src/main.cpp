#include <Arduino.h>
#include <Servo.h>
#include <avr/wdt.h>

Servo servo;
auto constexpr pin_servo = 2;

void setup()
{
  Serial.begin(9600);   // RX == 0, TX == 1
  servo.attach(pin_servo);
  //barrier_opened();
  {
    wdt_disable();
    wdt_enable(WDTO_1S);
  }
  Serial.write("booted\n");
}

void loop()
{
  for(auto angle=-90; angle<90; ++angle)
  {
    servo.write(angle)
    delay_ms(10);
    // TODO
    wdt_reset();
  }
}
