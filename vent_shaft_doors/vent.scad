use<detail/common.scad>
include <detail/config.scad>

module vent_lock()
{
  net_space = 0.5;
  wall_vertical = 1;
  wall_horizontal = 2.5;

  h = magnet_h + plastic_over_magnet - wall;
  d_slot = 2*r_shaft - 2*wall;
  d_ext = d_slot + 2*wall_horizontal;
  d_mid = d_slot - 2*net_space;
  d_int = d_mid - 2*wall_vertical;

  difference()
  {
    union()
    {
      cylinder(d=d_ext, h=wall_vertical);
      cylinder(d=d_mid, h=h);
    }
    translate([0, 0, -eps])
      cylinder(d=d_int, h=h+2*eps);
  }
}


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
  {
    translate([0, 0, -5/2])
      oring();
    translate([0, 0, 6.5 + 5])
      rotate([0, 180, 0])
      vent_lock();
  }
}


vent();

translate([2*r_shaft + 20, 0, 0])
  vent_lock();
