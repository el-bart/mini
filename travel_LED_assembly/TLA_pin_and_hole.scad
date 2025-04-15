use <detail/LED_profile.scad>
include <m3d/all.scad>
include <detail/config.scad>

base_len = 20;
base_side_wall = 3;
base_bottom_wall = 2;

base_d_hole = 4;
base_d_pin = 3;
base_d_spacing = 0.3 / 2;
base_d_ext = max(base_d_pin, base_d_hole) + 2*base_side_wall;

module _TLA_base_hole_center()
{
  translate([0, 0, base_d_ext/2])
    rotate([-90, 0, 0])
    children();
}

module _TLA_base_shape(mocks=false)
{

  translate([-profile_top_size.x/2, 0, 0])
    cube([profile_top_size.x, base_len, base_bottom_wall]);
  translate([-base_d_ext/2, 0, 0])
    cube([base_d_ext, base_len, base_d_ext/2]);
  _TLA_base_hole_center()
    cylinder(d=base_d_ext, h=base_len, $fn=fn(50));

  %if(mocks)
  {
    translate([0, base_len, -profile_top_size.y/2])
    rotate([90, 0, 0])
    linear_extrude(base_len+10)
      LED_profile_2d();
  }
}

module TLA_pin(mocks=false)
{
  rotate([90, 0, 0])
    difference()
    {
      _TLA_base_shape(mocks);
      translate([0, base_bottom_wall, 0])
        _TLA_base_hole_center()
        cylinder(d=base_d_hole + base_d_spacing, h=base_len, $fn=fn(60));
    }
}

TLA_pin(mocks=$preview);
