include <m3d/all.scad>
include <detail/config.scad>

module spring()
{
  module mount_holes_pos()
  {
    for(dy=[0, 10])
      translate([0, dy, 0])
        children();
  }

  module body()
  {
    cube([return_spring_w, return_spring_len, return_spring_h]);
    hull()
      mount_holes_pos()
      cylinder(d=return_sprint_screw_d+2*2, h=return_spring_h+1);
  }

  difference()
  {
    body();
    translate([0, 0, -eps])
      mount_holes_pos()
      cylinder(d=return_sprint_screw_d, h=return_spring_h + 1 + 2*eps, $fn=fn(50));
  }
}


spring();
