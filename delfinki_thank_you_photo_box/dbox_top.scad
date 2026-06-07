include <m3d/all.scad>
include <detail/config.scad>
use <detail/dbox_ext.scad>

module dolphin()
{
  linear_extrude(engraving_h)
    translate([-33, -90, 0])
    import("detail/happy_dolphin.svg");
}

module bottom()
{
  module ext()
  {
    intersection()
    {
      translate([0, 0, -box_cut_h])
        dbox_ext();
      cube([size_ext.x, size_ext.y, box_cut_h]);
    }
  }

  difference()
  {
    ext();
    translate([0, 0, box_cut_edge_h + walls.z - engraving_h ])
      dolphin();
  }
}


rotate([0, 180, 0])
  bottom();
