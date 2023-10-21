use <m3d/rounded_cube.scad>
use <m3d/fn.scad>

eps = 0.01;

module webcam()
{
  body_size = [55, 20, 40];
  body_rounding = 2;
  cylinder_h = 5;
  cylinder_d = body_size[2] * 2/3;
  cover_wall = 3;
  cylinder_ext_d = cylinder_d + 2*cover_wall;

  module optics()
  {
    module lens()
    {
      translate([0,0,cylinder_h/2/2])
        resize(cylinder_d*[1,1,0] + [0,0,cylinder_h/2])
          sphere(d=cylinder_d, $fn=fn(50));
      cylinder(d=cylinder_d, h=cylinder_h/2/2, $fn=fn(50));
    }
    module lens_with_cover()
    {
      lens();
      difference()
      {
        $fn=fn(90);
        cylinder(d=cylinder_ext_d, h=cylinder_h);
        translate([0,0,-eps])
          cylinder(d=cylinder_ext_d-2*cover_wall-2*0.1, h=cylinder_h+2*eps);
      }
    }
    lens_with_cover();
  }

  module body()
  {
    rounded_cube(body_size, body_rounding, $fn=fn(30));
  }

  body();
  translate([body_size[0]/2, body_size[1] - body_rounding, cylinder_ext_d/2])
    rotate([-90, 0, 0])
      optics();
}

webcam();
