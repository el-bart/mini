include <m3d/all.scad>
use <ext/threads/threads.scad>

wall = 1.5;
h_body = 100;
h_cap = 20 - wall;
d_ext = 50;
d_int = d_ext - 2*wall;

module cylinder_cap()
{
  translate([0, 0, h_body-h_cap])
    ScrewHole(outer_diam=d_int, height=h_cap+eps)
    translate([0, 0, -h_body+h_cap])
    difference()
    {
      cylinder(d=d_ext, h=h_body, $fn=fn(50));
      translate([0, 0, wall])
        cylinder(d=d_int, h=h_body-h_cap, $fn=fn(50));
    }
}


module cylinder_body()
{
  translate([0, 0, wall])
    difference()
    {
      ScrewThread(outer_diam=d_int, height=h_cap);
      cylinder(d=d_int - 6*wall-2*wall, h=h_cap, $fn=fn(50));
    }
  cylinder(d=d_ext, h=wall, $fn=fn(50));
}


translate([0, d_ext + 5, 0])
  cylinder_cap();

cylinder_body();
