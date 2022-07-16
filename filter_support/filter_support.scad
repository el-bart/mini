eps=0.01;

module support()
{
  rotate([90, 0, 0])
  {
    // main block
    intersection()
    {
      difference()
      {
        cube([30, 30, 10]);
        // magnet hole
        translate([5, -eps, 10/2])
          rotate([-90, 0, 0])
            cylinder(d=5+0.5, h=5+0.5+eps, $fn=25);
        // main rounding
        translate([30, 30, -eps])
          cylinder(r=30, h=10+2*eps, $fn=200);
      }
      // truncating sharp edges
      cube([25, 25, 10+2*eps]);
    }
    // support prolonging
    cube([1.2, 35, 10]);
  }
}


support();
