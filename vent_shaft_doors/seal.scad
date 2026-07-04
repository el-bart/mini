use<detail/common.scad>
include <detail/config.scad>

module seal()
{
  difference()
  {
    cylinder(r=r_shaft+15, h=magnet_h + plastic_over_magnet);
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

seal();
