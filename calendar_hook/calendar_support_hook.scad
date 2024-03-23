use <m3d/fn.scad>
use <m3d/rounded_cube.scad>
include <m3d/math.scad>

d = 3.5;
d_torus_ext = 20;
sup_len = d;
mount_len = 20;
wall = 1.5;
spacing = 0.15;
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
  extra_len = 10;
  s = [mount_len, mount_len + 2*r + wall + extra_len, d];
  s_sup = [d, mount_len, sup_len];
  s_int = s_sup + spacing*[2,1,0];
  s_ext = s_int + wall*[2,1,0];

  // base
  difference()
  {
    translate([-s.x/2, -r, 0])
      rounded_cube(size=s, corner_r=r);
    // string hole
    translate([0, s.y - r - extra_len*1/3, -eps])
      cylinder(d=3, h=s.z+2*eps);
  }

  // support elements
  translate([0, 0, s.z])
  {
    difference()
    {
      translate([-s_ext.x/2, 0, 0])
        cube(s_ext);
      translate([-s_int.x/2, wall, 0])
        cube(s_int + eps*[0, 1, 1]);
    }
  }

  %if(mocks)
    translate([0, spacing, s.z])
      rotate([0, 0, 180])
        translate([d/2, -d/2-wall, 0])
          rotate([0, -90, 0])
            translate([sup_len+d/2, 0, d/2])
              hook();
}

translate([mount_len/2 + 10, mount_len, d/2])
  hook();

plate(mocks=true);
