use<../m3d/fn.scad>
use<../m3d/rounded_cube.scad>
include<config.scad>


module hinge_block()
{
  wall = 2;
  d = 1.75 + 0.3;
  h = d + 2*wall;
  base = h;
  length = hinge_len;
  eps = 0.01;

  module c2p()
  {
    translate([0, base/2, h-(wall+d)])
      rotate([0, 90, 0])
        children();
  }

  module core()
  {
    difference()
    {
      // main body
      hull()
      {
        cube([length, base, eps]);
        c2p()
          cylinder(d=d+wall, h=length, $fn=fn(50));
      }
      // hinge hole
      translate([-eps, 0, 0])
        c2p()
          cylinder(d=d, h=length+2*eps, $fn=fn(50));
    }
  }

  translate([-length/2, 0, 0])
    rotate([-90, 0, 0])
      core();
}


module hinge_locations()
{
  a = hinge_side_dist;
  c = size.x-hinge_side_dist;
  b = (a+c)/2;
  for(dx=[a, b, c])
    translate([dx, size.y, cut_h])
      children();
}


module box()
{
  module body()
  {
    difference()
    {
      side_rounded_cube(size, corner_r=corner_r, $fn=fn(50));
      translate(wall*[1, 1, 1])
        side_rounded_cube(size-2*wall*[1,1,1], corner_r=corner_r, $fn=fn(50));
    }
  }

  module hinge_low()
  {
    for(dx=[-1,+1])
      translate([dx*(hinge_len + hinge_spacing/2), 0, 0])
        hinge_block();
  }

  body();
  hinge_locations()
    hinge_low();
}

intersection()
{
  box();
  cube([1000, 1000, cut_h]);
}
