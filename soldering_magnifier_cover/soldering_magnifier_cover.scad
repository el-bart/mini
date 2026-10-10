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

  linear_extrude(2)
    profile();
}

cover();
