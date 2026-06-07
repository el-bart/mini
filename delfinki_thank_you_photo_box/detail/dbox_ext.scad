include <../m3d/all.scad>
include <config.scad>


module dbox_ext()
{
  module base()
  {
    s = size_ext - roundings*[2,2,1];
    minkowski()
    {
      translate(roundings*[1,1,0])
        side_rounded_cube(s, corner_r=corner_r, $fn=fn(50));
      sphere(r=roundings, $fn=fn(25));
    }
  }

  // remove bottom rounding
  intersection()
  {
    base();
    cube(size_ext);
  }
}


dbox_ext();
