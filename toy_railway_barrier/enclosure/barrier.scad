use <m3d/fn.scad>
eps = 0.01;

module barrier()
{
  difference()
  {
    cube([130, 10, 4]);
    // drag lift slot
    translate([-eps, 2/2, 2])
      cube([20+eps+5, 8, 2+eps]);
    // screw slot
    translate([4, 10/2, -eps])
      cylinder(d=4, h=10, $fn=fn(50));
  }
}

barrier();
