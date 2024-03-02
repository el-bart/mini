use<detail/box.scad>
include<detail/config.scad>


module top()
{
  intersection()
  {
    box();
    translate([0, 0, cut_h])
      cube([size.x, size.y+20, size.z]);
  }
  hinge_locations()
    hinge_top();
}


rotate([180, 0, 0])
  top();
