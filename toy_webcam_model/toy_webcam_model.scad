use <m3d/rounded_cube.scad>
use <m3d/fn.scad>

eps = 0.01;

module webcam()
{
  body_size = [55, 20, 40];
  body_rounding = 2;
  cylinder_h = 8;
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
    module support()
    {
      wall = 2.5;
      slot = 9.5 + 0.75;
      module support_element()
      {
        h = 10 + body_rounding;
        size = [body_size[0]-2*body_rounding, wall, h];
        translate([0, -wall, 0])
          rounded_cube(size, wall/2.5, $fn=fn(30));
      }
      translate([body_rounding, 0, 0])
      {
        translate([0, -wall-slot, 0])
          support_element();
        support_element();
      }
    }
    rounded_cube(body_size, body_rounding, $fn=fn(30));
    translate([0, body_size[1]-body_rounding, body_size[2]-body_rounding])
      support();
  }

  body();
  translate([body_size[0]/2, body_size[1] - body_rounding, cylinder_ext_d/2])
    rotate([-90, 0, 0])
      optics();
}


webcam();
