include <m3d/all.scad>
include <detail/config.scad>
use <detail/main_tube.scad>

cable_cut_h = 100;
cable_cut = [10, 7] + rounding*[2,2];


module body()
{
  difference()
  {
    main_tube(body_len);
    // PIR cable cut
    translate([wall+spacing, wall+eps, cable_cut_h])
      rotate([90, 0, 0])
      side_rounded_cube([cable_cut.x, cable_cut.y, wall + spacing + 2*eps], rounding, $fn=fn(40));
  }
}


body();
