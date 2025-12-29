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

  render()
    difference()
    {
      linear_extrude(h)
        ext_n();
      translate([0, 0, wall])
        linear_extrude(h)
        int_n();
      // avoid sharp corners near the top
      union()
      {
        x = d/3;
        translate([d/2, 0, h - x/sqrt(2)])
          rotate([45, 0, 0])
          cube(x*[0,1,1] + [(n-1)*d, 0, 0]);
      }
      // avoid almost-unprintable edge inside
      translate([d/2, -wall, wall])
        cube([(n-1)*d, d/4, h]);
    }
}


holder(n=4);
