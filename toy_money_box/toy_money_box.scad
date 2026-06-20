include <m3d/all.scad>

ext_size = [50, 30, 60];
coin_slot_dh = [24, 2] + [2, 1];
wall = 2.0;
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
  module main()
  {
    _center()
    {
      $fn=fn(40);
      side_rounded_cube([ext_size.x, ext_size.y, wall], r);
    }
  }

  module screw_holes()
  {
    screw_pos()
      translate([0, 0, -eps])
      cylinder(d=screw_slot_d, h=wall+2*eps, $fn=fn(40));
  }

  module coin_slot()
  {
    cs_d = coin_slot_dh[0];
    cs_h = coin_slot_dh[1];
    int = [cs_d, cs_h, cs_d/2+5];
    ext = int + wall*[2,2,1];

    module _center_slot(s)
    {
      translate(-1/2*[s.x, s.y, 0])
        children();
    }

    difference()
    {
      union()
      {
        children();
        _center_slot(ext)
          cube(ext);
      }
      _center_slot(int)
        translate([0, 0, -eps])
        cube(int + [0,0, wall + 2*eps]);
    }
  }

  difference()
  {
    coin_slot()
      main();
    screw_holes();
  }
}


box();
translate([0, ext_size.y+5, 0])
  cover();
