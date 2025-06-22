include <config.scad>
include <../m3d/all.scad>

module screw_pos()
{
  for(r=[0 : 360/screw_n : 360])
    rotate([0,0,r + screw_angle_diff])
      translate([0, d_ext/2 + screw_hole_d/2 + wall, 0])
      children();
}

module screw_slot(h)
{
  difference()
  {
    union()
    {
      cylinder(d=screw_hole_d + 2*wall, h=h, $fn=fn(40));
      translate(screw_hole_d*[-1,-2,0])
        cube([2*screw_hole_d, 2*screw_hole_d, h]);
    }
    translate([0,0,h+eps])
      ti_cnck_m3_short(dl=1);
    translate([0,0,-eps])
      cylinder(d=screw_hole_d, h=h+eps, $fn=fn(40));
  }
}
