include <m3d/all.scad>

h = 0.8;
tape_space = 25 ;
size = [160 + tape_space, 44 + tape_space, h];
corner_r= 3;
pipe_d = 34;
pipe_spacing_d = 0.5;
pipe_pos_oy = [20, 20 + pipe_d + 55];

module cover()
{
  difference()
  {
    side_rounded_cube(size, corner_r, $fn=fn(30));
    // pipe holes
    translate([pipe_d/2, pipe_d/2, -eps])
      for(dx=pipe_pos_oy)
        translate([dx, 0])
          cylinder(d = pipe_d + pipe_spacing_d, h = h + 2*eps, $fn=fn(80));
  }
  // helper disks
  translate([pipe_d/2, 0, 0])
    for(dx=pipe_pos_oy)
      translate([dx, 0])
        cylinder(d=10, h = 0.2, $fn=fn(80));
}

cover();
