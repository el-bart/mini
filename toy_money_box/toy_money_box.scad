include <m3d/all.scad>

ext_size = [50, 20, 100];
coin_slot_dh = [24, 2] + [2, 1];
wall = 1.5;
r = 1.3;
screw_slot_d = 3+0.4;;

int_size = ext_size - wall*[2,2,2];

module _center()
{
  translate(-1/2*[ext_size.x, ext_size.y, 0])
    children();
}


module screw_pos()
{
  off = screw_slot_d/2 + wall;
  for(dx=[-1,+1])
    for(dy=[-1,+1])
      translate([dx*(ext_size.x/2 - off), dy*(ext_size.y/2 - off), 0])
        children();
}


module box()
{
  module body()
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

  module threaded_insert_slots()
  {
    h = 15;

    module core()
    {
      module repos()
      {
        translate([0, 0, ext_size.z - h])
          screw_pos()
          children();
      }

      difference()
      {
        $fn=fn(30);
        union()
        {
          children();
          repos()
            cylinder(d=4+wall+2, h=h);
        }
        repos()
        {
          translate([0, 0, wall])
            cylinder(d=screw_slot_d, h=h);
          translate([0, 0, h+eps])
            ti_cnck_m3_short();
        }
      }
    }

    intersection()
    {
      core()
        children();
      hull()
        body();
    }
  }

  threaded_insert_slots()
    body();
}


module cover()
{
}


box();
cover();
