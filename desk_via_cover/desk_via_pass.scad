include <detail/config.scad>
use <desk_via_cover.scad>
use <m3d/fn.scad>

module desk_via_pass(rounding = top_h)
{
  d_int = via_d - 2*wall;
  d_ext = d_int + 2*rounding;
  module rounding()
  {
    difference()
    {
      union()
      {
        cylinder(d=d_int, h=rounding+eps);
        cylinder(d=d_ext, h=rounding);
        translate([0, 0, -eps])
          cylinder(d=d_ext, h=2*eps);
      }
      translate([0, 0, rounding])
        rotate_extrude()
          translate([d_ext/2, 0, ])
            circle(r=rounding, $fn=fn(36));
    }
  }

  difference()
  {
    desk_via_cover();
    rounding();
  }
}


desk_via_pass(rounding = top_h*1.5);
