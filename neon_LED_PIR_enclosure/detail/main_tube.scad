include <../m3d/all.scad>
include <config.scad>

module main_tube(l)
{
  difference()
  {
    side_rounded_cube([dim_ext.x, dim_ext.y, l], rounding, $fn=fn(50));
    translate([0, 0, -eps])
      translate(wall*[1,1,0])
      cube([dim_int.x, dim_int.y, l + 2*eps]);
  }
}


main_tube(30);
