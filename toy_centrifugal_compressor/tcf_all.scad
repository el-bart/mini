use <tcf_bottom.scad>
use <tcf_fan.scad>
use <tcf_top.scad>
include <common/config.scad>

bottom();

translate([-d_ext - 10, 0, 0])
  top();

translate([d_ext, 0, 0])
  fan();
