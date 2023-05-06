#include <Arduino.h>
#include <Servo.h>
#include <avr/wdt.h>

namespace
{

Servo servo;
auto constexpr pin_servo = 2;
auto constexpr angle_low = 0;
auto constexpr angle_high = +95;

auto constexpr pin_button = 3;


void wait()
{
  delay(1000/50); // 50Hz servo
}

auto current_barrier_position = 0;

void barrier_up()
{
  Serial.write("rising...");
  for(auto angle=angle_low; angle<=angle_high; ++angle)
  {
    servo.write(angle);
    wait();
    wdt_reset();
  }
  Serial.write(" up!\n\r");
}

void barrier_down()
{
  Serial.write("lowering...");
  for(auto angle=angle_high; angle>=angle_low; --angle)
  {
    servo.write(angle);
    wait();
    wdt_reset();
  }
  Serial.write(" down!\n\r");
}

void toggle_barrier()
{
  current_barrier_position *= -1;
  switch(current_barrier_position)
  {
    case -1: barrier_down(); return;
    case +1: barrier_up();   return;
  }
}

void wait_for_button_press()
{
  auto const init = digitalRead(pin_button);
  while( digitalRead(pin_button) == init )
  {
    delay(20);
    wdt_reset();
  }
  Serial.write("button press detected\n\r");
}
}


void setup()
{
  Serial.begin(9600);   // RX == 0, TX == 1

  servo.attach(pin_servo);
  servo.write(angle_high);
  current_barrier_position = +1;

  pinMode(pin_button, INPUT);

  {
    wdt_disable();
    wdt_enable(WDTO_1S);
  }

  Serial.write("booted\n\r");
  wdt_reset();
}

void loop()
{
  wait_for_button_press();
  toggle_barrier();
  wdt_reset();
}
