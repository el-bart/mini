use<common/screw_pos.scad>
use<common/lego.scad>
include <common/config.scad>
include <m3d/all.scad>

module bottom()
{
  bh = h - wall;

  module core()
  {
    s_ext = [duct_ext, duct_len, bh];
    s_int = s_ext - wall*[2,0,2] + eps*[0,2,0];
    off = [-d_ext/2, 0, 0];
    difference()
    {
      union()
      {
        cylinder(d=d_ext, h=bh, $fn=fn(60));
        translate(off)
          cube(s_ext);
      }
      // duct's inside
      translate(off)
        translate(wall*[1,0,1] + eps*[0,-1,0])
        cube(s_int);
      // inner cur
      translate([0,0,wall])
        cylinder(d=d_int, h=bh, $fn=fn(120));
    }
    // bottom support
    cylinder(d=10, h=wall+fan_spacing);
  }

  module screw_slot()
  {
    difference()
    {
      union()
      {
        cylinder(d=screw_hole_d + 2*wall, h=bh, $fn=fn(40));
        translate(screw_hole_d*[-1,-2,0])
          cube([2*screw_hole_d, 2*screw_hole_d, bh]);
      }
      translate([0,0,bh+eps])
        ti_cnck_m3_short(dl=1);
      translate([0,0,-eps])
        cylinder(d=screw_hole_d, h=bh+eps, $fn=fn(40));
    }
  }

  difference()
  {
    core();
    translate([0,0,-eps])
      lego_round_slot(wall+fan_spacing+2*eps);
  }
  difference()
  {
    screw_pos()
      screw_slot();
    cylinder(d=d_mid, h=bh+eps);
  }
}

bottom();
