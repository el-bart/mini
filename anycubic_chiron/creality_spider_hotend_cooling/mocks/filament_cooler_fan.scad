use <../m3d/fn.scad>

eps = 0.01;

module filament_cooler_fan_screw_holes()
{
  span = 37 - 2*1.9/2;
  // M3 screw holes
  for(ix=[-1,+1])
    for(iy=[-1,+1])
      translate([ix*span/2, iy*span/2, -eps])
        children();
}

module filament_cooler_fan()
{
  wall = 1.2;
  size = [40, 40, 10.16];
  difference()
  {
    translate([-size.x/2, -size.y/2, 0])
      cube(size);
    h = size.z+2*eps;
    // fan hole
    translate([0, 0, wall])
    {
      translate([size.x/2-15.75, 0, 0])
        cylinder(d=28, h=h);
    }
    d = 1.9;
    // M1.5 screw holes
    filament_cooler_fan_screw_holes()
      cylinder(d=d, h=h, $fn=fn(20));
    // screw places
    translate([0, 0, wall])
    filament_cooler_fan_screw_holes()
      translate([0, 0, h/2+wall])
        cube(5*[1,1,0]+[0,0,h], center=true);
    // bottom fan output
    x = 28;
    translate([-x/2, -size.y/2-eps, wall])
      cube([x, size.y/2, size.z-2*wall]);
  }
}


filament_cooler_fan();
