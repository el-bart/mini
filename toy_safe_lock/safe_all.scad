use <safe_bolt.scad>
use <safe_bolt_guide.scad>
use <safe_key.scad>
use <safe_wall_block.scad>


safe_bolt();

translate([-20, 24, 0])
  key();

for(dx=[-1,+1])
  translate([dx*15, -20, 0])
    safe_bolt_guide();

translate([-45, 10, 0])
  rotate([0, 0, -90])
  safe_wall_block();
