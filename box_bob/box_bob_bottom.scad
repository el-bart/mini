use<detail/box.scad>
include<detail/config.scad>


intersection()
{
  box();
  cube([size.x, size.y+20, cut_h]);
}
