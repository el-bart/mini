include <m3d/all.scad>

module lock()
{
  base = 26.5;
  angle = 90-atan(base / (6.2-4.15));
  echo( str("angle = ", angle) );
  h = 9.5;
  center_d = 13.4 + 1;
  size = [base, base, h];

  module high_end()
  {
    difference()
    {
      side_rounded_cube(size, 2, $fn=fn(30));
      // center hole
      translate([size.x/2, size.y/2, -eps])
        cylinder(d=center_d, h=h+2*eps, $fn=fn(50));
      // insertion slot
      translate([size.x, size.y/2, eps])
        cube([base, center_d, 2*h+eps], center=true);
    }
  }

  translate([0, 0, h])
    rotate([180, 0, 0])
      rotate([angle, 0, 0])
        intersection()
        {
          rotate([-angle, 0, 0])
            high_end();
          cube(2*size);
        }
}


lock();
