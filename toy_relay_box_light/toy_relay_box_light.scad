include <m3d/all.scad>

module xc_cube(size)
{
  translate([-size.x/2, 0, 0])
    cube(size);
}


module box()
{
  wall = 1.2;

  xc_cube([40, 40, wall]);

  translate([0, -20, 0])
    xc_cube([20, 20, wall]);

  translate([0, 40, 0])
  {
    xc_cube([20, 45, wall]);
    translate([0, 45-34, wall])
      xc_cube([20, 34, 9]);
  }

  span = 40 + 2*wall/2;
  for(dx=[-1, +1])
    translate([dx*span/2, 0, 0])
      xc_cube([wall, 40, 30]);
}


box();
