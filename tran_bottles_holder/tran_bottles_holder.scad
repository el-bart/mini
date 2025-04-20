include <m3d/all.scad>

module tran_bottle_holder(n, mocks=false)
{
  wall = 2;

  bottle_size = [75, 40, 150];

  slot_size = [80, 45, 20];
  slot_rounding = 3;

  size = [slot_size.x, n*slot_size.y, slot_size.z] + wall*[2, 3, 1];
  rounding_ext = slot_rounding + wall;

  module bottle_mock()
  {
    side_rounded_cube(bottle_size, 5);
  }

  module slot(dh=eps)
  {
    ss = slot_size;
    bs = bottle_size;
    side_rounded_cube(ss + [0,0,dh], slot_rounding);
    %if(mocks)
      translate(0.5*[ss.x-bs.x, ss.y-bs.y, 0])
      bottle_mock();
  }

  difference()
  {
    side_rounded_cube(size, rounding_ext, $fn=fn(30));
    translate(wall*[1,1,1])
      for(dy=[0:n-1])
        translate([0, dy*(slot_size.y+wall), 0])
          slot();
  }
}


tran_bottle_holder(n=2, mocks=$preview);
