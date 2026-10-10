include <m3d/all.scad>

d_int = 165;
rim = 15;
d_ext = d_int + 2*rim;
cover_h = 2;
depth_long = 15;
tooth_angle = 30;

module cover()
{
  module profile()
  {
    module tooth(dir)
    {
      off = (dir > 0) ? : 0 : -rim;
      translate([off, -depth_long, 0])
        square([rim, depth_long]);
    }

    translate([-d_ext/2, 0])
      square([d_ext, cover_h]);

#
    tooth(+1);
  }

  profile();
}

cover();
