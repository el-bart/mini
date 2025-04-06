use <detail/hook.scad>
include <m3d/all.scad>

module engine_mount()
{
  h = 5;
  ext = 10;
  screw_span = 50;
  engine_d = 42;

  module hole_slots()
  {
    for(dx=[-1,+1])
      translate(dx*[screw_span/2, 0, 0])
        children();
  }

  // engine mock
  %if($preview)
  {
    cylinder(d=engine_d, h=15);
    hole_slots()
      cylinder(d=3, h=10, $fn=fn(10));
  }

  module body()
  {
    rotate([0, 0, -90])
      hook();
    cylinder(d=engine_d+ext, h=h);
    hole_slots()
      cylinder(d=15, h=h);
  }

  difference()
  {
    body();
    translate([0, 0, -eps])
    {
      cylinder(d=engine_d+0.5, h=h+2*eps);
      if(0)
        translate([-engine_d/2, -engine_d, 0])
          cube([engine_d, engine_d, h+2*eps]);
      hole_slots()
        cylinder(d=3.5, h=h+2*eps, $fn=fn(50));
    }
  }
}

engine_mount();
