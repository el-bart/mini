include <m3d/all.scad>

ext_size = [50, 20, 100];
coin_slot_dh = [24, 2] + [2, 1];
wall = 1.5;
r = 1.3;

int_size = ext_size - wall*[2,2,2];

module _center()
{
  translate(-1/2*[ext_size.x, ext_size.y, 0])
    children();
}


module box()
{
  _center()
    difference()
    {
      $fn=fn(40);
      side_rounded_cube(ext_size, r);
      translate(wall*[1,1,1])
        side_rounded_cube(int_size + [0,0,wall+eps], r - wall/2);
    }
}


module cover()
{
}


box();
cover();
