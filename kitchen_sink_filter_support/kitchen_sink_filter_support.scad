use <m3d/fn.scad>
include <m3d/math.scad>

wall = 3;
d_int = 7.8 + 0.7;
d_ext = d_int + 2*wall;
h = 10;

difference()
{
  $fn = fn(70);
  cylinder(d=d_ext, h=h);
  translate([0, 0, -eps])
    cylinder(d=d_int, h=h+2*eps);
}
