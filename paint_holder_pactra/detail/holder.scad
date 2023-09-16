include <config.scad>
use <paint_mock.scad>
use <../m3d/fn.scad>

eps = 0.01;


module holder(rows, cols)
{
  paint_slot_d = paint_d + 3;
  size = [
           2*wall + 1*side_space + rows*(paint_slot_d+side_space),
           2*wall + 1*side_space + cols*(paint_slot_d+side_space),
           wall + paint_h + top_space
         ];
  size_cut_bottom_2d = [size[0], size[1]] - stack_cut*[2,2];
  module edge_shape()
  {
    hull()
    {
      translate((stack_cut-eps)*[0,0,1])
        cube(size - [0,0,size[2]-eps]);
      translate(stack_cut*[1,1,0])
        cube([size_cut_bottom_2d[0], size_cut_bottom_2d[1], stack_cut]);
    }
  }
  
  // bottom
  edge_shape();
  // center - top stack cut
  difference()
  {
    translate([0, 0, stack_cut])
      cube(size - [0, 0, stack_cut]);
    translate([0, 0, size[2]-stack_cut+eps])
      edge_shape();
  }
}


holder(rows=1, cols=2);
