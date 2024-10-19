use <m3d/fn.scad>
use <detail/LED_angle_profile_2d.scad>
include <m3d/math.scad>
include <detail/config.scad>

wall = angle_led_mount_wall;
l = angle_led_mount_support_len;


module profile_slot(l)
{
  linear_extrude(2*l)
    offset(delta=angle_led_frame_spacing)
      led_angle_profile_2d();
}


module support(mocks)
{
  %if(mocks)
    translate([0, 0, -l/2])
      linear_extrude(2*l)
        led_angle_profile_2d();

  difference()
  {
    linear_extrude(l)
      offset(delta=wall)
        led_angle_profile_2d();
    translate([0, 0, -eps])
    {
      profile_slot(l+2*eps);
      // LED space
      translate(angle_led_frame_wall*[1, 1, 0])
        cube(angle_led_frame_side*[2, 2, 0] + [0, 0, l+2*eps]);
    }
  }
}


support(mocks=$preview);
