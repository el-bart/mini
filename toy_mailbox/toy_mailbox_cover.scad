use <detail/hinge.scad>
include <m3d/all.scad>
include <detail/config.scad>


module cover()
{
  size_int = size_ext - wall*[2,2,1];
  cut_2d = [220, 20];

  module body()
  {
    intersection()
    {
      rounded_cube(size_ext, wall, $fn=fn(30));
      translate([0, 0, size_ext.z - wall])
        cube(size_ext);
    }
  }

  module hinge_pair()
  {
    translate([hinge_d_total/2 + size_ext.x, hinge_block_len/2, -hinge_d_total/2 + hinge_d_total + size_ext.z - wall])
      rotate([0, 90, 0])
      rotate([0, 0, 180])
      rotate([90, 0, 0])
      hinge(hinge_screw_d + 0.1);
  }

  body();

  for(dy=[hinge_dist_edge, size_ext.y-hinge_dist_edge])
    translate([0, dy, 0])
      hinge_pair();

}


translate([0, 0, -size_ext.z + wall])
  cover();
