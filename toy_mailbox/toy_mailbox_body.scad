use <detail/hinge.scad>
include <m3d/all.scad>
include <detail/config.scad>


module box()
{
  size_int = size_ext - wall*[2,2,1];
  cut_2d = [220, 20];

  module body()
  {
    difference()
    {
      rounded_cube(size_ext, wall, $fn=fn(30));
      // gut the interior
      translate(wall*[1,1,1])
        cube(size_int + [0,0,1]);
      // entry slot
      translate([(size_ext.x - cut_2d.x)/2, size_ext.y - 2*wall, size_ext.z - cut_2d.y])
        cube([cut_2d.x, 3*wall, cut_2d.y+eps]);
      // remove top rounding
      translate([0, 0, size_ext.z - wall])
        cube(size_ext);
    }
  }

  module lock_hinge()
  {
    screw_d = 3.1;
    d = screw_d + 2*hinge_wall;
    h = size_ext.z - wall;
    spacing = 2;

    translate([-d/2 - spacing, 0, 0])
    {
      difference()
      {
        union()
        {
          cylinder(d=d, h=h, $fn=fn(40));
          translate([0, -d/2, 0])
            cube([d/2 + spacing + wall, d, h]);
        }
        // screw hole
        translate([0, 0, wall])
          cylinder(d=screw_d, h=h, $fn=fn(50));
      }
    }
  }

  module hinge_pair()
  {
    for(dy=[-1,+1])
      translate([hinge_d_total/2 + size_ext.x, dy*(hinge_block_len + hinge_play/2) + hinge_block_len/2, -hinge_d_total/2 + hinge_d_total + size_ext.z - wall])
        rotate([90, 0, 0])
        hinge(hinge_screw_d + 0.1);
  }

  body();

  translate([0, 0.6*size_ext.y, 0])
    lock_hinge();

  for(dy=[hinge_dist_edge, size_ext.y-hinge_dist_edge])
    translate([0, dy, 0])
      hinge_pair();

}


intersection()
{
box();
//cube([400, 50, 300]);
}
