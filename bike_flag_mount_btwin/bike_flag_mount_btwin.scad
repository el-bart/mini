use<m3d/fn.scad>

d_stick = 6;
d_a = 7; // bottom hole (aka: hole A)
d_b = 8; // top hole (aka: hole B)
a_b_distance = 10.5; // distance between A and B holes (edges! not the centers!)
b_top_distance = 18; // distance from top of B hole to end of bike's frame (edge! not the center!)

module screw_holes(h, extra_d=0.5)
{
  translate([0, d_a/2+a_b_distance+d_b/2, 0])
    cylinder(d=d_b+extra_d, h=h, $fn=fn(60));
  cylinder(d=d_a+extra_d, h=h, $fn=fn(60));
}

translate([-6/2, 0, 0])
  cube([6, a_b_distance+d_a/2+d_b+b_top_distance, 0.4]);
screw_holes(0.8, extra_d=0);
