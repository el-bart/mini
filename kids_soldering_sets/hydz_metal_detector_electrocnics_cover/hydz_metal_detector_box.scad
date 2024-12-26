include <m3d/math.scad>
use <m3d/rounded_cube.scad>
use <m3d/fn.scad>

pcb_size = [32, 40.1, 1.6];  // just the square part
solder_space = 1.9;          // max space for THT elements on the bottom
pcb_xy_spacing = 1.4;
wall = 2;


module pcb_mock()
{
  cube(pcb_size + [5, 0, 0]);
  translate([55.5, pcb_size.y/2, 0])
    cylinder(d=61.3, h=pcb_size.z);
}


module box(mocks)
{
  int_size = pcb_size + [0,0,solder_space] + pcb_xy_spacing*[2,2,0];
  ext_size = int_size + wall*[2,2,1];
  
  difference()
  {
    side_rounded_cube(ext_size, wall, $fn=fn(50));
    // inner cut
    translate(wall*[1,1,1])
      cube(int_size + [0,0,eps]);
    // space for front sensor out
    translate([ext_size.x - wall-eps, -eps, wall + solder_space-eps])
      cube([wall+2*eps, ext_size.y+2*eps, ext_size.z]);
  }
  
  %if(mocks)
    translate((wall+pcb_xy_spacing)*[1,1,0] + [0,0,wall+solder_space])
      pcb_mock();
}

box(mocks=true);
