include <m3d/all.scad>
include <detail/config.scad>
use <detail/dbox_ext.scad>

module top()
{
  module ext()
  {
    intersection()
    {
      translate([0, 0, -box_cut_h])
        difference()
        {
          dbox_ext_cut();
          dbox_cut_shape(only_cut=false);
        }
      cube([size_ext.x, size_ext.y, box_cut_h]);
    }
  }

  module dolphin()
  {
    linear_extrude(engraving_h)
      translate([-33, -90, 0])
      import("detail/happy_dolphin.svg");
  }

  difference()
  {
    ext();
    translate([0, 0, box_cut_edge_h + walls.z - engraving_h ])
      dolphin();
  }
}


rotate([0, 180, 0])
  top();
