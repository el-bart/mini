use <TLA_base_leg.scad>
use <TLA_conn_angle.scad>
use <TLA_conn_straight.scad>

for(i=[1:6])
  translate([i*16, 0, 0])
  rotate([0, -90, 0])
  TLA_base_leg();

for(i=[1:2])
  translate([(i-1)*45, -7, 0])
  rotate([90, 0, 0])
  TLA_conn_angle();

for(i=[1:6])
  translate([-20, (i-1)*20, 0])
  TLA_conn_straight();
