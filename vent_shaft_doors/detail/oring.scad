include <config.scad>

module oring_(d_int, fi)
{
  r_int=d_int/2;
  rotate_extrude($fn=0.2*360)
    translate([r_int+fi/2, 0, 0])
      rotate([0, 0, 180])
        circle(r=fi/2, $fn=20);
}

module oring()
{
  oring_(oring_d_int, oring_phi);
}

module oring_slot(dh=0)
{
  h = 5-oring_slot_dh + dh;
  spacing = 0.2;
  difference()
  {
    cylinder(d=oring_d_int + 2*oring_phi + 2*spacing, h=h);
    translate([0, 0, -eps])
      cylinder(d=oring_d_int, h=h+2*eps);
  }
}


module magnet_positions()
{
  for(r=[0 : 360/magnets_n : 360])
    rotate([0, 0, r])
      translate([0, magnet_pos_r, 0])
      children();
}


module magnet_slots(dh=0)
{
  magnet_positions()
  {
    // magnet slot
    cylinder(d=magnet_d+0.2, h=magnet_h+dh, $fn=fn(50));
    // air-venting holes
    translate([0,0,-100+eps])
      cylinder(d=2, h=100, $fn=fn(20));
  }
}


oring();

translate([0, 0, 8])
  oring_slot();

translate([0, 0, -8 - magnet_h])
  magnet_slots();
