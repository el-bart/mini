include <m3d/math.scad>
use <m3d/fn.scad>

module toilet_paper_mock()
{
  h = 100;
  difference()
  {
    cylinder(d=125, h=h); // upper bound diameter
    translate([0, 0, -eps])
      cylinder(d=40, h=h+2*eps); // lower bound diameter
  }
}


toilet_paper_mock();
