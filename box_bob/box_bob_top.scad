use<detail/box.scad>
use<m3d/rounded_cube.scad>
use<m3d/fn.scad>
include<detail/config.scad>


module top_snap()
{
  s = [20, 5, 10];
  module body()
  {
    translate([-s.x/2, -s.y/2, -s.z/2])
      intersection()
      {
        rounded_cube(s, 2, $fn=fn(50));
        cube([s.x, s.y/2, s.z]);
      }
  }

  difference()
  {
    body();
    minkowski()
    {
      snap();
      cube(0.4*[1,1,1], center=true);
    }
  }
}


module top()
{
  eps = 0.01;
  intersection()
  {
    box();
    translate([0, -eps, cut_h+eps])
      cube([size.x, size.y+20, size.z]);
  }
  hinge_locations()
    hinge_top();
  translate([size.x/2, 0, cut_h])
    top_snap();
}


rotate([180, 0, 0])
  top();
