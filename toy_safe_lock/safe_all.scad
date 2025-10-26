use <safe_bolt.scad>
use <safe_bolt_guide.scad>
use <safe_key.scad>


safe_bolt();

translate([-20, 20, 0])
  key();

for(dx=[-1,+1])
  translate([dx*15, -20, 0])
    safe_bolt_guide();
