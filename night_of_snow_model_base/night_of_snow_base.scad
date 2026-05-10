include <m3d/all.scad>

module base()
{
  r = 20;
  h = 5;
  wall = 1;
  base_size = [75, 30];
  size = [base_size.x, base_size.y, h];

  $fn=fn(120);

  difference()
  {
    hull()
    {
      side_rounded_cube(size + wall*[2,2,1], 1);

      linear_extrude(eps)
        minkowski()
        {
          square(base_size + wall*[2,2]);
          circle(r=r);
        }
    }
    translate(wall*[1,1,1])
      side_rounded_cube(size + [0,0,eps], 0.5);
  }
}

base();
