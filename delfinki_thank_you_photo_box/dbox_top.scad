include <m3d/all.scad>
include <detail/config.scad>
use <detail/dbox_ext.scad>


module bottom()
{
  intersection()
  {
    translate([0, 0, -box_cut_h])
      dbox_ext();
    cube([size_ext.x, size_ext.y, box_cut_h]);
  }
}


bottom();
