include <m3d/all.scad>

module glob_holder_replacement()
{
  $fn=fn(80);
  difference()
  {
    union()
    {
      cylinder(d=37.75, h= 2);
      cylinder(d=33.50, h=12);
    }
    translate([0, 0, 2])
      cylinder(d=27.5, h=12);
    translate([0, 0, -eps])
      cylinder(d=10.5+0.5, h=2+2*eps);
  }
}


glob_holder_replacement();
