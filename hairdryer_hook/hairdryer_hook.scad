include <m3d/all.scad>

rounding = 1.5;
thickness = 10 + 2*rounding;
d_int = 100;
d_ext = d_int + 2*thickness;
extra_h = 25;
extra_h_top = 5;

module screw_slot()
{
  s = 0.6;
  d = 3.5 + s;
  $fn=fn(40);

  module body()
  {
    cylinder(d1=8+s, d2=d, h=3.5);
    cylinder(d=d, h=25);
  }

  rotate([-90, 0, 0])
    body();
}


module hook()
{
  t = thickness - 2*rounding;
  de = d_ext - 2*rounding;
  module core_whole()
  {
    cylinder(d=de, h=t, $fn=fn(100));
    translate([-de/2, 0, 0])
    {
      cube(t*[1,0,1] + [0, de/2 + extra_h, 0]);
      translate([0, de/2 + extra_h, 0])
      {
        cube(t*[0,1,1] + [de*2/3, 0, 0] + [0, extra_h_top, 0]);
        translate(t*[1, -2, 0])
          difference()
          {
            rr = 2*t;
            cube(rr*[1,1,0] + [0,0,t]);
            translate(t*[2,0,0] + [0,0,-eps])
              cylinder(r=rr, h=t+2*eps, $fn=fn(50));
          }
      }
    }
  }

  module core()
  {
    module main_hook()
    {
      difference()
      {
        di = d_int + 2*rounding;
        core_whole();
        translate([0, 0, -eps])
          cylinder(d=di, h=t+2*eps, $fn=fn(100));
        translate([-di/2,0,-eps])
          cube(d_ext*[1, 1/2, 0] + [0,0,t+2*eps]);
      }
    }

    minkowski()
    {
      main_hook();
      sphere(r=rounding, $fn=fn(20));
    }
  }

  difference()
  {
    core();
    // screw holes
    for(dx=[-25, 8])
      translate([dx, de/2 + extra_h - rounding - eps, t/2])
        screw_slot();
    // flat top
    translate([-d_ext/2, de/2 + extra_h + t + extra_h_top, -rounding])
      cube([d_ext, rounding, t + 2*rounding]);
  }
}


hook();
