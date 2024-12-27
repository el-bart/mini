use <m3d/fn.scad>
use <m3d/screw_head_hex.scad>
include <m3d/math.scad>

pr_h = 1.6;
pr_d = 6;
pr_cut_x = 5;
pr_cut_len = 2.7;
spacing = 0.4;

wall = 2;
handle_h = 25;
handle_d = pr_d + wall + 2*5;
handle_rounding = 2;
hex_h = 10;


module knob()
{
  module socket()
  {
    module pr_slot(dh)
    {
      module base_2d()
      {
        difference()
        {
          circle(d=pr_d, $fn=fn(50));
          translate([0, -pr_cut_x])
            square([pr_cut_len, pr_d], center=true);
        }
      }

      linear_extrude(pr_h + dh)
        offset(delta=spacing)
          base_2d();
    }
  
    difference()
    {
      cylinder(d=pr_d+2*wall, h=pr_h+wall, $fn=fn(50));
      translate([0, 0, -eps])
        pr_slot(dh=eps);
    }
  }
  
  module handle()
  {
    cylinder(d=handle_d, h=handle_h);
    translate([0, 0, handle_h-hex_h-handle_rounding])
      minkowski()
      {
        screw_head_hex(y=handle_d, h=hex_h);
        sphere(r=handle_rounding, $fn=fn(20));
      }
    
  }

  socket();
  translate([0, 0, pr_h+wall])
    handle();
}


rotate([180, 0, 0])
  knob();
