use <m3d/fn.scad>
include <m3d/math.scad>


module key()
{
  cylinder(d=4.5, h=15, $fn=fn(50));
  // tooth
  translate([0, -2.5/2, 0])
    cube([5, 2.5, 4]);
  // holder
  rotate([0, 0, 90])
    hull()
      translate([0, 0, 15])
      {
        cylinder(d=4.5, h=eps, $fn=fn(50));
        translate([0, 0, 16])
          cube([4.5, 16, eps], center=true);
      }
}

key();
