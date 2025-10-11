include <../m3d/all.scad>
include <config.scad>

module hinge(hole_d)
{
  d = hinge_d_total;
  r = d/2;

  module profile()
  {
    difference()
    {
      circle(d=d, $fn=fn(50));
      translate([0, -d])
        square([d,d]);
    }
    polygon([
        [-r,0],
        [r,0],
        [-r,-2*d],
    ]);
  }

  module profile_with_hole()
  {
    difference()
    {
      profile();
      circle(d=hole_d, $fn=fn(50));
    }
  }

  linear_extrude(hinge_block_len)
    profile_with_hole();
}


hinge(3);
