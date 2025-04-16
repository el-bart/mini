use <detail/LED_profile.scad>
include <m3d/all.scad>
include <detail/config.scad>

base_len = 20;
base_side_wall = 3;
base_bottom_wall = 2;

base_hole_spacing = 0.3;
base_d_hole = 4 + base_hole_spacing;
base_d_pin  = 3 + base_hole_spacing;
base_d_spacing = 0.3 / 2;
base_d_ext = max(base_d_pin, base_d_hole) + 2*base_side_wall;


module _TLA_base_hole_centers()
{
  for(dx=[-1,+1])
    translate([dx * (profile_base_size.x/2 - base_d_ext/2), 0, base_d_ext/2])
      rotate([-90, 0, 0])
      children();
}


module _TLA_base_shape(mocks=false)
{
  module hole_block()
  {
    _TLA_base_hole_centers()
    {
      rotate([+90, 0, 0])
        translate([-base_d_ext/2, 0, -base_d_ext/2])
        cube([base_d_ext, base_len, base_d_ext/2]);
      cylinder(d=base_d_ext, h=base_len, $fn=fn(50));
    }
  }

  translate([-profile_top_size.x/2, 0, 0])
    cube([profile_top_size.x, base_len, base_bottom_wall]);
  hole_block();

  %if(mocks)
  {
    translate([0, base_len, -profile_top_size.y/2])
    rotate([90, 0, 0])
    linear_extrude(base_len+10)
      LED_profile_2d();
  }
}


module _TLA_template(d, bottom_wall=0, mocks=false)
{
  module shape()
  {
    // top side
    difference()
    {
      _TLA_base_shape(mocks);
      translate([0, bottom_wall ? bottom_wall : -eps, 0])
        _TLA_base_hole_centers()
        cylinder(d=d + base_d_spacing, h=base_len+2*eps, $fn=fn(60));
    }
    // bottom rails
    difference()
    {
      bs = [profile_base_size.x, base_len, profile_top_size.y - profile_base_size.y];
      translate([-bs.x/2, 0, -bs.z])
        cube(bs);
      // cut-in
      translate([0, base_len+eps, -profile_top_size.y/2])
        rotate([90, 0, 0])
        linear_extrude(base_len + 2*eps)
        LED_profile_slot_2d();
    }
  }

  rotate([90, 0, 0])
    shape();
}


module TLA_hole(mocks=false)
{
  _TLA_template(base_d_hole, 0, mocks);
}


module TLA_pin(mocks=false)
{
  _TLA_template(base_d_pin, base_bottom_wall, mocks);
}


TLA_hole(mocks=$preview);

translate([0, 17, 0])
  rotate([0, 0, 180])
  TLA_pin(mocks=$preview);
