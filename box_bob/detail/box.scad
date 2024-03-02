use<../m3d/fn.scad>
use<../m3d/rounded_cube.scad>
include<config.scad>


module box()
{
  difference()
  {
    side_rounded_cube(size, corner_r=corner_r, $fn=fn(50));
    translate(wall*[1, 1, 1])
      side_rounded_cube(size-2*wall*[1,1,1], corner_r=corner_r, $fn=fn(50));
  }
}

intersection()
{
  box();
  cube([20, 20, 100]);
}
