use <m3d/fn.scad>
use <detail/LED_angle_profile_2d.scad>
include <m3d/math.scad>
include <detail/config.scad>

wall = angle_led_mount_wall;
l = angle_led_mount_endcap_len;


module profile_mock(l)
{
  translate([0, l, angle_led_frame_side])
    rotate([90, 90, 0])
      linear_extrude(l)
        led_angle_profile_2d();
}


module profile_slot(l)
{
  linear_extrude(l)
    offset(delta=angle_led_frame_spacing)
    led_angle_profile_2d();
}


module end_cap_right(mocks)
{
  %if(mocks)
    translate([0, 0, eps])
      linear_extrude(30)
        led_angle_profile_2d();

  difference()
  {
    linear_extrude(angle_led_mount_endcap_len)
      offset(delta=wall)
        led_angle_profile_2d();
    // cable hole
    translate(angle_led_frame_side/2*[1,1,0] - [0, 0, eps])
      cylinder(d=7, h=wall+2*eps, $fn=fn(40));
    translate([0, 0, wall])
    {
      profile_slot(l);
      // LED space
      translate(angle_led_frame_wall*[1, 1, 0])
        cube(angle_led_frame_side*[2, 2, 0] + [0, 0, l]);
    }
  }
}


module end_cap_left(mocks)
{
  mirror([1,0,0])
    end_cap_right(mocks);
}


end_cap_right(mocks=$preview);
translate(-[angle_led_mount_wall + 5, 0, 0])
  end_cap_left(mocks=$preview);
