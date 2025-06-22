use<common/screw.scad>
use<common/lego.scad>
use<tcf_fan.scad>
include <common/config.scad>
include <m3d/all.scad>

module top()
{
  module core()
  {
    module base_with_inlet()
    {
      difference()
      {
        cylinder(d=d_ext, h=wall, $fn=fn(60));
        translate([0,0,-eps])
          cylinder(d=inlet_d, h=wall+2*eps, $fn=fn(40));
      }
      for(r=[0 : 360/inlet_holders : 360])
        rotate([0,0,r])
          translate([0, -inlet_holder_width/2, 0])
          cube([inlet_d/2, inlet_holder_width, wall]);
    }

    base_with_inlet();
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
%if($preview)
  translate([0,0,wall+fan_spacing])
  fan();
