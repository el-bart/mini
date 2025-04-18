use <detail/LED_profile.scad>
include <m3d/all.scad>
include <detail/config.scad>


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
        cube([base_d_ext, base_len + base_hole_extra_len/2, base_d_ext/2]);
      cylinder(d=base_d_ext, h=base_len + base_hole_extra_len/2, $fn=fn(50));
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
        cylinder(d=d + base_d_spacing, h=base_len + base_hole_extra_len/2 + 2*eps, $fn=fn(60));
    }
    // bottom rails
    difference()
    {
      bottom_clearance = 0.75;
      bs = [profile_base_size.x, base_len, profile_top_size.y - profile_base_size.y - bottom_clearance];
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
