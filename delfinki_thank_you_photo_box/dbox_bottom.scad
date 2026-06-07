include <m3d/all.scad>
include <detail/config.scad>
use <detail/dbox_ext.scad>


module bottom()
{
  intersection()
  {
    dbox_ext();
    cube(size_ext - [0, 0, walls.z + eps]);
  }
}


bottom();
