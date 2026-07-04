use<seal.scad>
use<detail/common.scad>
include <detail/config.scad>

module bars_()
{
  l=2*r_shaft;
  for(i=[0:3])
    for(dir=[-1,+1])
      translate([i*dir*13, 0, 0])
        translate([-wall/2, -l/2, 0])
          cube([wall, l, wall]);
}


module lattice_()
{
  for(rot=[0, 90])
    rotate([0, 0, rot])
      bars_();
}


module vent()
{
  lattice_();

  difference()
  {
    cylinder(r=r_shaft+15, h=magnet_h + plastic_over_magnet);
    translate([0, 0, -eps])
      cylinder(r=r_shaft-wall, h=h+2*eps);
    translate([0, 0, plastic_over_magnet])
      magnet_slots(dh=eps);
  }

  for(dr=[0 : 360/magnets_n : 360])
    rotate([0, 0, dr])
      rotate([0, 0, 90])
      translate([r_shaft+3, 0, 0])
      grab();

  %if($preview)
    translate([0, 0, -5/2])
    oring();
}

vent();
