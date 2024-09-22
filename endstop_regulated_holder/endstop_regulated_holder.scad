use <m3d/threaded_inserts/cnc_kitchen.scad>
include <m3d/math.scad>

module endstop_mock()
{
  // main body
  difference()
  {
    cube([20.1, 10.7, 6.55]);
    // holes
    for(dx=[5.3, 14.72])
      translate([dx, 7.7, -1])
        cylinder(d=2.35, h=10, $fn=10);
  }
  // lever
  translate([2, -3.1, 1])
    rotate([0, 0, 10])
      cube([16, 0.3, 4.1]);
  // connectors
  for(dx=[1.75, 9.28, 18.15])
    translate([dx, 10.7 ,1.5])
      cube([0.5, 4.2, 3.13]);
}


module endstop_holder()
{
  module ti_mount()
  {
    difference()
    {
      translate([-8/2, 0, 0])
        cube([8, 4, 8]);
      translate([0, -eps, 4])
        rotate([90, 0, 0])
          ti_cnck_m3_short(dl=2*eps);
    }
  }

  %translate([0.5, 0, 2])
    endstop_mock();
  // base
  cube([21, 17, 2]);
  // threaded inserts slots
  for(dx=[-4, 21+4])
    translate([dx, 13, 0])
      ti_mount();
}


module holder_mount()
{
}



endstop_holder();

holder_mount();
