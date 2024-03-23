use <m3d/fn.scad>
use <m3d/rounded_cube.scad>
include <m3d/math.scad>

d = 3.5;
d_torus_ext = 20;
sup_len = 5;
mount_len = 20;
wall = 1.5;
spacing = 0.25;
$fn = fn(30);

module hook()
{
  module torus(d_ext, d_t)
  {
    rotate_extrude(angle=180, $fn=fn(70))
      translate([d_ext/2+d_t/2, 0])
        circle(d=d_t);
  }

  module extension(d, l)
  {
    rotate([90, 0, 0])
    cylinder(d=d, h=l-d/2);
    translate([0, -l+d/2, 0])
      sphere(d=d);
  }

  module hook_core()
  {
    translate([d_torus_ext/2+d/2, 0, 0])
      torus(d_ext=d_torus_ext, d_t=d);
    translate([d_torus_ext+d, 0, 0])
      extension(d=d, l=15);
    hull()
    {
      sphere(d=d);
      cs = [sup_len, d, d];
      translate([-cs.x-d/2, -cs.y/2, -cs.z/2])
        cube(cs);
    }
  }

  hook_core();
  // mount block
  cs = [d, mount_len, d];
  translate([-sup_len, -cs.y/2, 0])
    cube(cs, center=true);
}


module plate(mocks=false)
{
  r = d/2*0.9;
  s = [mount_len, mount_len+2*r, d];
  // base
  translate([-s.x/2, -r, 0])
    rounded_cube(size=s, corner_r=r);
  // support elements
  translate([0, 0, s.z])
  {
    s_sup = [d, sup_len, d];
    s_int = s_sup + spacing*[1,1,1];
    s_ext = s_int + wall*[1,1,0];
    difference()
    {
      translate([-s_ext.x/2, 0, 0])
        cube(s_ext);
      translate([-s_int.x/2, wall, 0])
        cube(s_int);
    }
  }
}

//hook();

plate(mocks=true);
