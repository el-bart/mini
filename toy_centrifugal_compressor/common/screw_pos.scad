include <config.scad>
include <../m3d/all.scad>

module screw_pos()
{
  for(r=[0 : 360/screw_n : 360])
    rotate([0,0,r + screw_angle_diff])
      translate([0, d_ext/2 + screw_hole_d/2 + wall, 0])
      children();
}
