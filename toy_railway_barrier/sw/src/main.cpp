#include <Arduino.h>
#include <Servo.h>
#include <avr/wdt.h>

namespace
{
Servo servo;
auto constexpr pin_servo = 2;
auto constexpr angle_low = 0;
auto constexpr angle_high = +95;

void wait()
{
  delay(1000/50); // 50Hz servo
}

void barrier_up()
{
  for(auto angle=angle_low; angle<=angle_high; ++angle)
  {
    servo.write(angle);
    wait();
    wdt_reset();
  }
}

void barrier_down()
{
  for(auto angle=angle_high; angle>=angle_low; --angle)
  {
    servo.write(angle);
    wait();
    wdt_reset();
  }
}
}


void setup()
{
  Serial.begin(9600);   // RX == 0, TX == 1
  servo.attach(pin_servo);
  servo.write(angle_high);
  {
    wdt_disable();
    //wdt_enable(WDTO_1S);
  }
  Serial.write("booted\n\r");
}

void loop()
{
  Serial.write("^");
  barrier_down();
  Serial.write(" ");
  barrier_up();
  Serial.write("v\n\r");
  wdt_reset();
}
