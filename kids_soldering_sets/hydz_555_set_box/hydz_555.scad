use <m3d/rounded_cube.scad>
use <m3d/fn.scad>
include <m3d/math.scad>

module hydz_555()
{
  r = 1;
  wall = 1.5;
  size_int = [78, 31, 7];
  size_ext = size_int + wall*[2,2,1];
  cut = 12;

  difference()
  {
    side_rounded_cube(size_ext, r, $fn=fn(50));
    translate(wall*[1,1,1])
    {
      // interrior
      cube(size_int + [0,0,eps]);
      // cable slot
      translate([size_int.x-eps, 5, 0])
        cube([wall+2*eps, cut, size_int.z+eps]);
    }
  }
}

hydz_555();
