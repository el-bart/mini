include <m3d/math.scad>
use <m3d/rounded_cube.scad>
use <m3d/fn.scad>

pcb_size = [60.8, 23.8, 2.5];
solder_space = 2.4; // max space for THT elements on the bottom
pcb_xy_spacing = 1.4;
wall = 2;


module box()
{
  int_size = pcb_size + [0,0,solder_space] + pcb_xy_spacing*[2,2,0];
  ext_size = int_size + wall*[2,2,1];
  
  difference()
  {
    side_rounded_cube(ext_size, wall, $fn=fn(50));
    translate(wall*[1,1,1])
      cube(int_size + [0,0,eps]);
  }
}

box();
