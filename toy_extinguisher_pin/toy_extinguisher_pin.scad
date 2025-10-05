include <m3d/all.scad>

d=4.75;
l=20;
ring_d=22;

module pin()
{
  module core()
  {
    translate([0, ring_d/2, 0])
      rotate([-90, 0, 0])
      cylinder(d=d, h=l, $fn=fn(50));
    rotate_extrude(angle=360, $fn=fn(50))
      translate([ring_d/2, 0])
      circle(d=d, $fn=fn(30));
  }

  linear_extrude(d/2)
    projection(cut=true)
    translate([0, 0, d/2-0.3])
    core();
  translate([0, 0, d/2])
    core();
}

pin();
