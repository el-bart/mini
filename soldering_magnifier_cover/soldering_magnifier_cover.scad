include <m3d/all.scad>

d_int = 165;
rim = 15;
d_ext = d_int + 2*rim;
cover_h = 2;
depth_long = 15;
tooth_angle = 30;
screw_slot_d = 3 + 0.5;

module _screw_holes_pos()
{
  for(dir=[-1,+1])
    translate([dir*(d_int/2-10), 0, 0])
      children();
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
    body();
    _screw_holes_pos()
      cylinder(d=screw_slot_d, h=cover_h+2*eps, $fn=fn(60));
  }
}

cover();
