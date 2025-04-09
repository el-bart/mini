include <../m3d/all.scad>
include <config.scad>

module LED_profile_2d()
{
  s1 = profile_base_size;
  s2 = profile_top_size;
  translate([-s1.x/2, -s2.y/2])
  {
    square(s1);
    translate([(s1.x-s2.x)/2, 0])
      square(s2);
  }
}

module LED_profile_slot_2d()
{
  offset(r=profile_offset_r, $fn=fn(20))
    LED_profile_2d();
}

LED_profile_slot_2d();
