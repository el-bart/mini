include <m3d/all.scad>

module opening_key()
{
  key_hole = [9.5 - 0.7, 2.6 - 0.8];
  key_len = 20;
  key_hold_d = 20;
  h = key_hole.y;
  rounding = 0.8;
  mount_hole_d = 4;

  assert( key_hole.y > 2*rounding );

  module profile_2d()
  {
    s = [key_hole.x, key_len] - rounding*[2,1] + [0, key_hold_d/2];
    difference()
    {
      union()
      {
        translate([-s.x/2, -key_hold_d/2])
          square(s);
        translate([0, -key_hold_d/2])
          circle(d=key_hold_d, $fn=fn(50));
      }
      translate([0, -key_hold_d + mount_hole_d/2 + 3])
        circle(d=mount_hole_d + 2*rounding, $fn=fn(20));
    }
  }

  translate([0,0,rounding])
    minkowski()
    {
      linear_extrude(h - 2*rounding)
        profile_2d();
      sphere(r=rounding, $fn=fn(20));
    }
}


opening_key();
