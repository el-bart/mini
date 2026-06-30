include <m3d/all.scad>

h = 14;
wall = 2;
int_size = [90, 21];
magnet_d = 5 + 0.5;
magnet_h = 5;
magnet_dist = 1;
magnet_out_space = 2.5;

ext_size = int_size + wall*[2,1];
wing = magnet_d + magnet_dist;

module holder()
{
  module profile()
  {
    difference()
    {
      translate([-ext_size.x/2, 0])
        square(ext_size);
      translate([-int_size.x/2, 0])
        square(int_size);
    }
    // side wings
    for(dx=[-1,+1])
      translate([dx*(wing/2 + ext_size.x/2), 0])
        translate([-wing/2, 0])
        square([wing, magnet_dist + magnet_h]);
  }

  difference()
  {
    linear_extrude(h)
      profile();
    // magnet holes
    for(dx=[-1,+1])
      translate([dx*(magnet_d/2 + ext_size.x/2), magnet_dist, h/2])
        rotate([-90, 0, 0])
        cylinder(d=magnet_d, h=magnet_h+eps, $fn=fn(50));
  }
}


holder();
