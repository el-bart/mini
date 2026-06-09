include <m3d/all.scad>
include <detail/config.scad>
use <detail/dbox_ext.scad>


module bottom()
{
  render()
    intersection()
    {
      dbox_ext_cut();
      dbox_cut_shape(only_cut=false);
    }

  // visualization of the photo deck inside
  %if($preview)
    translate([walls.x + photo_spacing.x/2, walls.y + photo_spacing.y/2, 0])
      cube(photo_size);
}


bottom();
