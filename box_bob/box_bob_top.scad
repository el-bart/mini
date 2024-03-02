use<detail/box.scad>
include<detail/config.scad>


intersection()
{
  translate([0, 0, -cut_h])
    box();
  cube([size.x, size.y+20, size.z]);
}
