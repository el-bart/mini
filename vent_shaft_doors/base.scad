use<detail/oring.scad>
use<detail/common.scad>
include <detail/config.scad>

module base()
{
  difference()
  {
    union()
    {
      cylinder(r=r_shaft, h=h);
      cylinder(r=r_shaft+30, h=wall + magnet_h);
    }

    // internal cut-out
    translate([0, 0, -eps])
      cylinder(r=r_shaft-wall, h=h+2*eps);

    translate([0, 0, -eps])
      oring_slot(dh=eps);

    translate([0, 0, plastic_over_magnet])
      magnet_slots(dh=wall);
  }

  %if($preview)
    translate([0, 0, oring_phi/2 - oring_slot_dh])
    oring();
}

base();
