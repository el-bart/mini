use <m3d/threaded_inserts/cnc_kitchen.scad>
use <m3d/fn.scad>
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


module holder_mount()
{
  module screw_slot()
  {
    difference()
    {
      translate([-8/2, 0, 0])
        cube([8, 4, 10.5]);
      translate([0, 5, 6.8])
        rotate([90, 0, 0])
          cylinder(d=3.5, h=10, $fn=fn(40));
    }
  }

  cube([21+2*8+2, 14+4, 2]);
  for(dy=[0, 14])
    for(dx=[4, 33+2])
      translate([dx, dy, 0])
        screw_slot();
}


module endstop_holder(mocks)
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

  %if(mocks)
    translate([0.5, 0, 2])
      endstop_mock();
  // base
  cube([21, 17, 2]);
  // threaded inserts slots
  for(dx=[-4-1, 21+4+1])
    translate([dx, 13, 0])
      ti_mount();
  // connector
  translate([-8-1, 13, 0])
    cube([21+2*8+2*1, 4, 2]);

  %if(mocks)
    translate([-8-1, 21, 10.8])
      rotate([180, 0, 0])
        holder_mount();
}



endstop_holder(mocks=true);

translate([-8-1, 19, 0])
  holder_mount();
