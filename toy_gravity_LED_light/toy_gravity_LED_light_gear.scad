include <m3d/all.scad>

module half_gear()
{
  wall = 2;
  holes = 3;
  h = 20;
  difference()
  {
    cylinder(d=40, h=h/2, $fn=fn(50));
    // inner cut
    translate([0, 0, -eps])
    {
      cylinder(d=7.59, h=7+eps, $fn=fn(50));
      cylinder(d=5, h=h/2+2*eps, $fn=fn(50));
    }
    // ring
    translate([0, 0, wall])
      difference()
      {
        cylinder(d=40+1, h=h/2, $fn=fn(50));
        cylinder(d=35, h=h/2, $fn=fn(50));
      }
    // screw holes
    for(i=[0:holes-1])
      rotate([0, 0, 360/holes]*i)
        translate([0, h/2, -eps])
        {
          cylinder(d=3.5, h=h/2+2*eps, $fn=fn(50));
          cylinder(d=6.5, h=h/2-16/3+eps, $fn=fn(50));
        }
  }
}

// engine side
half_gear();
