include <m3d/all.scad>


module holder()
{
  h = 10;
  d_int = 20;
  wall = 2;
  d_ext = d_int + 2*wall;
  opening_h = 0.85; // 0..1

  module profile()
  {
    module ring()
    {
      difference()
      {
        $fn=fn(50);
        circle(d=d_ext);
        circle(d=d_int);
        // opening
        translate([0, opening_h*d_int])
          translate([-d_ext, -d_int/2])
          square(2*d_ext*[1,1]);
      }
    }

    translate([0, d_ext/2])
      ring();
    translate([-d_ext/2, 0])
      square([d_ext, wall]);
  }

  linear_extrude(h)
    profile();
}


holder();
