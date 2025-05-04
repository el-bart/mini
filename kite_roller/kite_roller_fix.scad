//
// helper to fix the old print, with standing out elements
//
// do NOT print this part if you use the latest model. it's oly here for
// fixing legacy prints. newer parts have already proper edges in place.
//
include <m3d/all.scad>

module kite_roller_fix()
{
  wall = 2;
  h = 10;
  d_in = 120 + 0.5;
  d_out = d_in + 2*wall;
  bottom_edge = 8;

  $fn=fn(190);

  // lower ring
  difference()
  {
    cylinder(d=d_out, h=wall);
    translate([0, 0, -eps])
      cylinder(d=d_in - 2*bottom_edge, h=wall + 2*eps);
  }
  // upper ring
  translate([0, 0, wall])
    difference()
    {
      cylinder(d=d_out, h=h);
      translate([0, 0, -eps])
        cylinder(d=d_in, h=h + 2*eps);
    }
}


kite_roller_fix();
