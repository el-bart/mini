include <../m3d/all.scad>

module hook()
{
  h = 5;
  ext = 10;
  d_in = 40+10;
  d_out = d_in + 2*ext;
  boom = 30;

  module body()
  {
    cylinder(d=d_out, h=h, $fn=fn(50));
    translate([d_in/2, -ext/2, 0])
      cube([ext+boom, ext, h]);
  }

  module part()
  {
    difference()
    {
      body();
      translate([0,0,-eps])
      {
        cylinder(d=d_in, h=h+2*eps, $fn=fn(60));
        translate([1, -45-ext/2, 0])
          rotate([0, 0, 30])
            cube(45*[1,1,0] + [0,0,h+2*eps]);
      }
    }
  }

  translate([-d_out/2 - boom, 0, 0])
    part();
}

hook();
