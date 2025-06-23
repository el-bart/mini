use <../tcf_bottom.scad>
use <../tcf_fan.scad>
use <../tcf_top.scad>
include <../common/config.scad>
include <../m3d/all.scad>

module all_parts()
{
  bottom();

  translate([0, 0, wall + fan_spacing + fan_spacing/2])
    fan();

  translate([0,0,h])
    rotate([0,0,screw_angle_diff])
    rotate([0,180,0])
    top();
}


render()
  difference()
  {
    all_parts();
    translate([0,0,-eps])
      cube(100*[1,1,1]);
  }
