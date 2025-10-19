include <m3d/all.scad>
include <detail/config.scad>

module support()
{
  side_rounded_cube([dim_int.x, 20, wall], 2, $fn=fn(30));
}


support();
