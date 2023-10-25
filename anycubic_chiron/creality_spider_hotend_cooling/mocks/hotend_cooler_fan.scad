use <../m3d/fn.scad>

eps = 0.01;

module hotend_cooler_fan()
{
  size = [40.2, 40.2, 10.6];
  difference()
  {
    translate([-size.x/2, -size.y/2, 0])
      cube(size);
    h = size.z+2*eps;
    // fan hole
    translate([0, 0, -eps])
      cylinder(d=37.5, h=h);
    d = 3.5;
    span = 36 - 2*d/2;
    // M3 screw holes
    for(ix=[-1,+1])
      for(iy=[-1,+1])
        translate([ix*span/2, iy*span/2, -eps])
          cylinder(d=3.5, h=h, $fn=fn(20));
  }
}


hotend_cooler_fan();
