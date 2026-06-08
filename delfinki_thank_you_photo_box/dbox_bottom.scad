include <m3d/all.scad>
include <detail/config.scad>
use <detail/dbox_ext.scad>


module bottom()
{
  intersection()
  {
    dbox_ext_cut();
    dbox_cut_shape(only_cut=false);
  }
}


bottom();
