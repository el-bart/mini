use <tcp_bottom.scad>
use <tcp_fan.scad>
use <tcp_top.scad>
include <common/config.scad>

bottom();

translate([-d_ext - 10, 0, 0])
  top();

translate([d_ext + 5, 0, 0])
  fan();
