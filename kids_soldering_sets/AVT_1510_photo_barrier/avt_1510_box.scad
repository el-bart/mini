include <m3d/all.scad>

solder_space = 2.4; // max space for THT elements on the bottom
pcb_xy_spacing = 1.4;
wall = 2;



module receiver_box()
{
  pcb_size = [65.2, 40.7, 1.75];
  int_size = pcb_size + [0,0,solder_space] + pcb_xy_spacing*[2,2,0];
  ext_size = int_size + wall*[2,2,1];
  
  difference()
  {
    side_rounded_cube(ext_size, wall, $fn=fn(50));
    translate(wall*[1,1,1])
      cube(int_size + [0,0,eps]);
  }
}


receiver_box();
