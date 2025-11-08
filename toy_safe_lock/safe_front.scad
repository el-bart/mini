use <detail/key_profile.scad>
include <m3d/all.scad>
include <detail/config.scad>

rounding = 1.5;

module key_input()
{
  h1 = 1;
  h2 = 28;
  h = h1 + h2;

  module base()
  {
    // base plate
    cylinder(r=30, h=h1, $fn=fn(80));
    translate([0, 0, h1])
      hull()
        for(dy=[0, 26-2*12/2])
          translate([0, -dy, 0])
            cylinder(d=12, h=h2, $fn=fn(30));
  }

  module key_hole()
  {
    l = h + 2*eps;
    cylinder(d=key_d, h=l, $fn=fn(40));
    linear_extrude(l)
      key_profile();
  }

  difference()
  {
    base();
    translate([0,0,-eps])
      key_hole();
  }
}


key_input();
