use<detail/box.scad>
include<detail/config.scad>
use<box_bob_top.scad>


module bottom()
{
  intersection()
  {
    box();
    cube([size.x, size.y+20, cut_h]);
  }
}

bottom();
%top();
