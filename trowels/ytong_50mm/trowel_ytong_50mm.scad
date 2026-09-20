include <m3d/all.scad>

module trowel(width, delta=2)
{
  wall = 2;
  tooth_h = 5;
  n = 7;
  size_ext = [width + delta + 2*wall, 70, 50];
  size_int = size_ext - wall*[2,1,1];
  handle_size = [20, 100, 20];
  cut_angle = 30;

  module tooth()
  {
    h = tooth_h;
    b = width / n;
    translate([b/2, 0, 0])
      linear_extrude(wall)
      polygon([
          [0, 0],
          [0, h],
          [b/2, 0],
          [-b/2, 0],
          [0, h],
      ]);
  }

  // tooth pattern
  translate([wall + delta/2, size_ext.y - tooth_h, 0])
    for(i=[0:n-1])
      translate([i*width/n, 0, 0])
        tooth();

  // main body
  difference()
  {
    // box
    cube(size_ext);
    translate(wall*[1,1,1])
      cube(size_int + eps*[0,1,1]);
    // cut for teeth
    translate([wall, size_ext.y - tooth_h, -eps])
      cube(size_int + eps*[0,1,1]);
    // angled cut
    translate([-eps, wall, size_ext.z])
      rotate([-cut_angle, 0, 0])
      cube(size_ext + [2*eps, size_ext.y, size_ext.y]);

  }

  // handle
  translate([size_ext.x/2 - handle_size.x/2, -handle_size.y + wall, 0])
    rounded_cube(handle_size, wall);
}


trowel(50);
