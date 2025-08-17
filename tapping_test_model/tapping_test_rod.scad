include <m3d/all.scad>

oversize = 0.5;

cube([20, 10, 10]);
translate([10, 5, 10])
  cylinder(d=3 + oversize, h=10, $fn=fn(30));

translate([20, 5, (5+oversize)/2])
  rotate([0, 90, 0])
  cylinder(d=5 + oversize, h=10, $fn=fn(30));
