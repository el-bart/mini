use <m3d/fn.scad>
use <m3d/screw_head_hex.scad>

module knob()
{
  module hole()
  {
    cylinder(d=8.5, h=7.5, $fn=fn(40));
    translate([0, 0, 2])
      screw_head_hex_m5(dy=0.6, dh=1.1);
  }
  module base()
  {
    a = 20;
    h = 10;
    size = [a, a, h];
    translate(-size/2 + [0,0,h/2])
      cube(size);
    for(dx=[-1, +1])
      for(dy=[-1, +1])
        translate((a/2 - 0.15*a/2)*[dx, dy, 0])
          cylinder(d=7, h=h, $fn=fn(30));
  }
  
  difference()
  {
    base();
    translate([0, 0, 2.51])
      hole();
  }
}


knob();
