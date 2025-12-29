include <m3d/all.scad>

module holder(n)
{
  wall = 1.5;
  d = 16 + 2.5;
  h = 80;

  module int_2d()
  {
    translate([d/2, 0])
      circle(d=d, $fn=fn(40));
    square([d, d/2]);
  }

  module int_n()
  {
    for(i=[0:n-1])
      translate([i*d, 0, 0])
        int_2d();
  }

  module ext_n()
  {
    offset(delta=wall)
      int_n();
  }

  difference()
  {
    linear_extrude(h)
      ext_n();
    translate([0, 0, wall])
      linear_extrude(h)
      int_n();
  }
}

holder(n=4);
