use <m3d/fn.scad>
use <detail/LED_angle_profile_2d.scad>
include <m3d/math.scad>
include <detail/config.scad>

wall = angle_led_mount_wall;
l = angle_led_mount_endcap_len;
ext_offset = angle_led_frame_side + 1*wall + 1*angle_led_frame_spacing;
ext_len    = angle_led_frame_side + 2*wall + 2*angle_led_frame_spacing;


module profile_mock(l)
{
  translate([-ext_offset, l, angle_led_frame_side])
    rotate([90, 90, 0])
      linear_extrude(l)
        led_angle_profile_2d();
}


module profile_slot(l, delta = angle_led_frame_spacing)
{
  linear_extrude(l)
    offset(delta=delta)
      led_angle_profile_2d();
}


module profile_ext_frame_2d()
{
  offset(delta=angle_led_frame_spacing + wall)
    led_angle_profile_2d();
}


module profile_ext_frame(l, mocks)
{
  translate([-ext_offset, l + angle_led_mount_corner_space, angle_led_frame_side])
    rotate([90, 90, 0])
      difference()
      {
        linear_extrude(l + angle_led_mount_corner_space)
          profile_ext_frame_2d();
        // front slot
        translate([0, 0, -eps])
        {
          profile_slot(l+eps);
          // LED cut
          translate(angle_led_frame_wall*[1, 1, 0])
            cube(angle_led_frame_side*[2, 2, 0] + [0, 0, l]);
          // LED strip endstop
          translate([0, 0, angle_led_mount_endcap_len-eps])
            profile_slot(wall+eps, delta=-1.5);
        }
      }
  %if(mocks)
    translate([0, angle_led_mount_corner_space, 0])
      profile_mock(l+20);
}


module profile_ext_corner()
{
  // TODO: add upper surface for a top mount
  pos_fix = angle_led_frame_spacing + wall;
  translate([0,0, angle_led_frame_side + pos_fix])
    rotate([0, 180, 90])
      rotate_extrude(angle=90, $fn=fn(150))
        translate([ext_len, 0])
          mirror([1, 0])
            translate((pos_fix - 0.0001)*[1,1])
              profile_ext_frame_2d();
}


module profile_ext_body(mocks)
{
  profile_ext_frame(l, mocks);
  profile_ext_corner();
  mirror([1, 0, 0])
    rotate([0, 0, 90])
      profile_ext_frame(l, mocks);
}


profile_ext_body(mocks=$preview);
