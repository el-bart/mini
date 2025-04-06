use <detail/hook.scad>
include <m3d/all.scad>

module roller_mount()
{
  h = 5;
  ext = 10;
  screw_span = 50;
  wall = 2;
  // 5x11x5 mm
  bearing_d = 11;
  bearing_h = 5;

  // bearing mock
  %if($preview)
    translate([0, 0, wall])
      cylinder(d=bearing_d, h=bearing_h);

  module body()
  {
    rotate([0, 0, -90])
      hook();
    cylinder(d=bearing_d+2*ext, h=wall+bearing_h);
  }

  difference()
  {
    body();
    translate([0, 0, wall])
      cylinder(d=bearing_d+0.5, h=bearing_h+eps, $fn=fn(50));
    translate([0, 0, -eps])
      cylinder(d=5+1, h=wall+2*eps, $fn=fn(50));
  }
}

roller_mount();
