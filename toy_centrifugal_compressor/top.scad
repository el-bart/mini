use<common/screw.scad>
use<common/lego.scad>
include <common/config.scad>
include <m3d/all.scad>

module top()
{
  module core()
  {
    cylinder(d=d_ext, h=wall, $fn=fn(60));
    // top support
    cylinder(d=10, h=wall+fan_spacing);
    // screws
    screw_pos()
      screw_slot(h=wall);
  }

  difference()
  {
    core();
    translate([0,0,-eps])
      lego_round_slot(wall+fan_spacing+2*eps);
  }
}

top();
