include <config.scad>

module led_angle_profile_2d()
{
  s = angle_led_frame_side;
  w = angle_led_frame_wall;
  polygon([
    [0, 0],
    [0, s],
    [w, s],
    [s, w],
    [s, 0]
  ]);
}

//offset(r=1, $fn=20)
led_angle_profile_2d();
