include <m3d/all.scad>

module pipe()
{
  wall = 1;
  d_in = 7.4 + 3;
  h = 30;
  turn_d = 20 + 2*d_in/2;

  module profile2d()
  {
    difference()
    {
      circle(d=d_in+2*wall, $fn=fn(50));
      circle(d=d_in, $fn=fn(50));
    }
  }

  // dome
  translate([0, 0, h])
    rotate([90, 0, 0])
    rotate_extrude(angle=180)
    translate([turn_d/2, 0])
    profile2d();
  // legs
  for(dx=[-1,+1])
    translate([dx*turn_d/2, 0])
      linear_extrude(h)
      profile2d();
}


pipe();
