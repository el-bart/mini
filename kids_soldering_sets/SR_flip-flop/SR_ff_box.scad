include <m3d/all.scad>

wall = 1.2;
spacing = 0.75;
int_size = [80.3, 20.3, 5] + spacing*[2,2,0];
ext_size = int_size + wall*[2,2,1];

difference()
{
  side_rounded_cube(ext_size, wall, $fn=fn(50));
  translate(wall*[1,1,1])
    cube(int_size + [0,0,eps]);
}
