include <../m3d/all.scad>

module LED_profile_2d()
{
  s1 = [28.25, 1.1];
  s2 = [22.5,  (8.15 + 8.20)/2];
  translate([-s1.x/2, -s2.y/2])
  {
    square(s1);
    translate([(s1.x-s2.x)/2, 0])
      square(s2);
  }
}

module LED_profile_slot()
{
  r = 0.2;
  offset(r=r, $fn=fn(20))
    LED_profile_2d();
}

LED_profile_slot();
