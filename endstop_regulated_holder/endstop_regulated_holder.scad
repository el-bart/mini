use <m3d/threaded_inserts/cnc_kitchen.scad>

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
}


module holder_mount()
{
}



endstop_holder();

holder_mount();

//%endstop_mock();
