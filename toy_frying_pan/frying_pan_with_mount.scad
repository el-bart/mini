use <frying_pan.scad>
use <mount.scad>

frying_pan();

translate([75, 40, 12])
  rotate([0, 180, 0])
    mount();

// just for visualization purposes
%translate([0, -(121.5+20+5)/2, -20])
  mount();
