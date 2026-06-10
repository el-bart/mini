include <m3d/all.scad>

module gabit()
{
  h = 50;
  $fn = fn(80);
  difference()
  {
    cylinder(d=16.0, h=h);
    translate([0, 0, -eps])
      cylinder(d=11.1, h=h + 2*eps);
  }
}


gabit();
