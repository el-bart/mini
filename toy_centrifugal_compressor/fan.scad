use<common/lego.scad>
include <common/config.scad>
include <m3d/all.scad>

module fan()
{
  bh = h - 2*wall - 2*fan_spacing;
  br = ( d_int - 2*fan_spacing ) / 2;

  module core()
  {
    module core_2d()
    {
      circle(d=9, $fn=fn(60));
      for(r=[0 : 360/fan_blade_n : 360])
        rotate([0,0,r])
          translate([0, -fan_blade_thickness/2])
          square([br, fan_blade_thickness]);
    }
    intersection()
    {
      linear_extrude(bh)
        core_2d();
      cylinder(d=2*br, h=bh, $fn=fn(120));
    }
  }

  difference()
  {
    core();
    translate([0,0,-eps])
      lego_axle_slot(bh+2*eps);
  }
}

fan();
