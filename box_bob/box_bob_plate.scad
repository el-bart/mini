use<box_bob_top.scad>
use<box_bob_bottom.scad>
include<detail/config.scad>

bottom();

translate([0, -10, size.z])
  rotate([180, 0, 0])
    top();
