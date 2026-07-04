include <../m3d/all.scad>

$fn = fn(360);

wall = 2;
r_shaft = 99.1/2;
h = 70;

oring_d_int = 100;
oring_phi = 5;
oring_slot_dh = 0.2; // how much shorter the slot is vs. actual oring size

magnets_n = 3;
magnet_h = 5;
magnet_d = 5;
plastic_over_magnet = 2*0.2;
magnet_pos_r = (oring_d_int + 2*oring_phi)/2 + 4;
