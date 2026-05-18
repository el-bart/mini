include <m3d/all.scad>

module ctrl_box()
{
  spacing = [2,2,0];
  size_int = [60, 40, 5] + spacing;
  wall = 1.2;
  size_ext = size_int + wall*[2,2,1];

  difference()
  {
    side_rounded_cube(size_ext, wall, $fn=fn(50));
    translate(wall*[1,1,1])
      cube(size_int + [0,0,eps]);
  }
}

ctrl_box();
