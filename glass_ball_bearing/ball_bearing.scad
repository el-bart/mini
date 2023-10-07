use <detail/ball_bearing.scad>
use <m3d/fn.scad>

d_in=5;
d_ball=4;
d_out=30;
n=6;
wall=2;
spacing=0.4;
cage_spacing=0.4;
$fn=fn(70);

ball_bearing_core(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);

for(i=[0:1])
  translate([d_out + i*(d_out-d_ball), 0, 0])
    ball_bearing_half_cage(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
