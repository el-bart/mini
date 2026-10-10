include <m3d/all.scad>

d_int = 165;
rim = 15;
d_ext = d_int + 2*rim;
cover_h = 2;
depth_long = 15;
tooth_angle = 30;

screw_slot_d = 3 + 0.5;
screw_head_slot_d = 6;
screw_head_slot_h = 3.4;

handle_h_int = 35;
handle_d = 12;
handle_cut = 1;

module _screw_holes_pos()
{
  for(dir=[-1,+1])
    translate([dir*(d_int/2-10), 0, 0])
      children();
}


module handle()
{
  $fn=fn(60);
  h = handle_h_int - handle_d/2;

  module bar()
  {
    module bar_round()
    {
      module corners()
      {
        _screw_holes_pos()
          translate([0, 0, h])
          sphere(d=handle_d);
      }

      hull()
        corners();

      _screw_holes_pos()
        difference()
        {
          cylinder(d=handle_d, h=h);
          // place for threaded insert
          translate([0, 0, -eps])
            rotate([180, 0, 0])
            ti_cnck_m3_short(dl=10);
        }
    }

    intersection()
    {
      bar_round();
      s = [2*d_ext, handle_d - 2*handle_cut, d_ext];
      translate([-s.x/2, -s.y/2, 0])
        cube(s);
    }
  }

  translate([0, 0, (handle_d - 2*handle_cut)/2])
    rotate([-90, 0, 0])
    bar();
}


module cover()
{
  module body()
  {
    module profile()
    {
      module tooth(dir)
      {
        mirror([(dir>0)?0:1, 0])
          translate([0, -depth_long, 0])
          intersection()
          {
            square([rim, depth_long]);
            rotate([0, 0, tooth_angle])
              square(2*rim*[1,1]);
          }
      }

      translate([-d_ext/2, 0])
        square([d_ext, cover_h]);

      for(dir=[-1,+1])
        translate([dir*(d_ext/2-rim), 0])
          tooth(dir);
    }

    rotate([180, 0, 0])
      translate([0, 0, -cover_h])
      rotate_extrude(angle=360, $fn=fn(360))
      intersection()
      {
        profile();
        translate([0, -d_ext/2])
          square([d_ext,d_ext]);
      }
  }

  difference()
  {
    union()
    {
      body();
      // screw protecting cover
      _screw_holes_pos()
        translate([0, 0, cover_h])
        difference()
        {
          $fn=fn(60);
          cylinder(d=screw_head_slot_d+2*2, h=screw_head_slot_h);
          cylinder(d=screw_head_slot_d,     h=screw_head_slot_h+eps);
        }
    }

    _screw_holes_pos()
      translate([0, 0, -eps])
      cylinder(d=screw_slot_d, h=cover_h + 2*eps, $fn=fn(60));
  }
}

cover();

translate([0, d_ext/2, 0])
  handle();
