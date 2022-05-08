use<m3d/fn.scad>

d_a = 7;
d_b = 8;
a_b_distance = 10.5;
b_top_distance = 18;

module screw_holes(h, extra_d=0.5)
{
  translate([0, d_a/2+a_b_distance+d_b/2, 0])
    cylinder(d=d_b+extra_d, h=h, $fn=fn(60));
  cylinder(d=d_a+extra_d, h=h, $fn=fn(60));
}

translate([-6/2, 0, 0])
  cube([6, a_b_distance+d_a/2+d_b+b_top_distance, 0.4]);
screw_holes(0.8, extra_d=0);
