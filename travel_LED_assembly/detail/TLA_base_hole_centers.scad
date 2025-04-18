include <../m3d/all.scad>
include <config.scad>


module TLA_base_hole_centers()
{
  for(dx=[-1,+1])
    translate([dx * (profile_base_size.x/2 - base_d_ext/2), 0, 0])
      children();
}
