include <m3d/all.scad>

flat_d = 26;
d = 14;
h = 7;
wall = 1.2;

module cap()
{
  $fn=fn(60);
  difference()
  {
    union()
    {
      cylinder(d=flat_d, h=wall);
      cylinder(d=d+wall, h=h);
    }
    translate([0,0,-eps])
      cylinder(d=d, h=h+2*eps);
  }
}

cap();
