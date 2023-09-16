include <config.scad>
use <paint_mock.scad>
use <../m3d/fn.scad>

eps = 0.01;
d_sc = 0.75;


module wall_2d()
{
  sc = stack_cut;
  h = bottom_edge + paint_h + top_space;
  off_h = sc/sin(45);
  polygon([
            [0, sc],
            [0, h-sc-d_sc],
            [sc-d_sc, h-2*sc],
            [2*sc, h-2*sc],
            [2*sc, h-3*sc],
            [sc, h-4*sc],
            [sc, off_h],
            [off_h, sc],
            [off_h, 0],
            [sc, 0]
          ]);
}


module holder_walls(rows, cols)
{
  ly = side_space + cols*(paint_d+d_sc+side_space);
  lx = side_space + rows*(paint_d+d_sc+side_space);
  module back_wall()
  {
    l = lx - 2*stack_cut;
    rotate([0, 0, -90])
    translate([0, l/2, 0])
      rotate([90, 0, 0])
        linear_extrude(l)
          wall_2d();
  }
  module left_wall()
  {
    l = ly - stack_cut;
    translate([0, l, 0])
      rotate([90, 0, 0])
        linear_extrude(l)
          wall_2d();
  }
  module right_wall()
  {
    translate([2*stack_cut, 0, 0])
      mirror([1,0,0])
        left_wall();
  }
  module corner()
  {
    rotate_extrude(angle=90, $fn=fn(40))
      translate([-2*stack_cut, 0, 0])
        wall_2d();
  }
  module left_corner()
  {
    translate([0, 2*stack_cut, 0])
      corner();
  }
  module right_corner()
  {
    translate([0, 2*stack_cut, 0])
      corner();
  }

  translate([-stack_cut-lx/2, 0, 0])
  {
    left_wall();
    translate([0, ly-stack_cut, 0])
      rotate([0, 0, 270])
        left_corner();
  }

  translate([-stack_cut+lx/2, 0, 0])
  {
    right_wall();
    translate([0, ly + stack_cut, 0])
      rotate([0, 0, 180])
        right_corner();
  }

  translate([0, ly+stack_cut, 0])
    back_wall();
}


module bottom(rows, cols)
{
  module bottom_block()
  {
    d = 2*(paint_d + side_space);
    hull()
      intersection()
      {
        holder_walls(rows, cols);
        translate([-(rows*d)/2, 0, 0])
          cube([rows*d, cols*d, bottom_edge]);
      }
  }
  d_p = paint_d + 3;
  module paint_slot(mock=true)
  {
    translate([0, side_space + d_p/2, stack_cut])
    {
      cylinder(d=d_p, h=bottom_edge, $fn=fn(50));
      if(mock)
        %paint_mock();
    }
  }
  x_offsets = [ for(x=[0:rows-1])
                  if (rows%2==0)
                    x-rows/2+0.5
                  else
                    x-(rows-1)/2
              ];
  // cut holes for paints
  difference()
  {
    bottom_block();
    for(ix=x_offsets)
      for(iy=[0:cols-1])
        translate([ix*(d_p+1) , iy*(d_p+1), 0])
          paint_slot();
  }
  // poles for pain samples
  {
    for(ix=x_offsets)
      translate([ix*(d_p+1) - d_p/2, 5/2+1, bottom_edge])
        color("cyan")
          cylinder(d=5, h=2, $fn=fn(20));
  }
}


module holder(rows, cols)
{
  holder_walls(rows, cols);
  bottom(rows, cols);
}


holder(rows=5, cols=2);
