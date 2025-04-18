use <TLA_pin_and_hole.scad>
include <m3d/all.scad>
include <detail/config.scad>

leg_h = 3;
leg_len = 150;
leg_w = profile_top_size.y;
leg_rounding = 1.25;


module _TLA_base_leg_template(d)
{
  module holes(d, dh=2*eps)
  {
    TLA_base_hole_centers()
      cylinder(d=d + base_d_spacing, h=base_len + base_hole_extra_len/2 + dh, $fn=fn(60));
  }

  module base()
  {
    // mount
    translate([0, 0, leg_h])
      difference()
      {
        hull()
          holes(d=10, dh=0);
      }
    // leg
    hull()
    {
      cylinder(d=profile_base_size.x, h=leg_h, $fn=fn(90));
      translate([0, leg_len, 0])
        cylinder(d=2*profile_base_size.x, h=leg_h, $fn=fn(160));
    }
  }

  difference()
  {
    base();
    translate([0, 0, leg_h])
      holes(d);
  }
}


module TLA_base_leg_hole(mocks=false)
{
  _TLA_base_leg_template(base_d_hole);
  %if(mocks)
    translate([0, 5, leg_h + 2*(base_len + base_hole_extra_len/2) + 2])
      rotate([0, 180, 0])
      TLA_hole();
}

module TLA_base_leg_pin(mocks=false)
{
  _TLA_base_leg_template(base_d_pin);
  %if(mocks)
    translate([0, 5, leg_h + 2*(base_len + base_hole_extra_len/2) + 2])
      rotate([0, 180, 0])
      TLA_pin();
}


TLA_base_leg_hole(mocks=$preview);

translate([profile_base_size.x+3, 0, 0])
  rotate([0, 0, 180])
  TLA_base_leg_pin(mocks=$preview);
