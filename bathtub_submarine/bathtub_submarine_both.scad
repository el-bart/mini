include <detail/config.scad>
use <bathtub_submarine_left.scad>
use <bathtub_submarine_right.scad>

translate([d*1.2, 0, 0])
  sub_left();

sub_right();
