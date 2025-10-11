include <m3d/all.scad>
include <detail/config.scad>

screw_d = 3.1;
d = screw_d + 2*hinge_wall;
bom_len = d + wall + 12;
h = wall + 0.4 + d;
spacing = 0.2;
screw_head_d = 5.2+0.5;
screw_head_h = 5;


module lock_print()
{
  translate([-d/2 - spacing, 0, 0])
  {
    difference()
    {
      union()
      {
        cylinder(d=d, h=h, $fn=fn(40));
        translate([0, -d/2, 0])
          side_rounded_cube([bom_len, d, d], wall, $fn=fn(50));
      }
      // screw head hole
      translate([0, 0, -eps])
        cylinder(d=screw_head_d, h=screw_head_h+eps, $fn=fn(50));
      // screw hole
      translate([0, 0, screw_head_h + 0.2])
        cylinder(d=screw_d+0.5, h=h, $fn=fn(50));
    }
  }
}


module lock()
{
  translate([-wall, 0.6*size_ext.y, size_ext.z - wall])
    translate([0, 0, h])
    rotate([180, 0, 0])
    lock_print();
}


lock_print();
//lock();
