include <m3d/all.scad>

module cam_hold()
{
  // M3x12
  l = 50;
  r = 2;
  h1 = 8;

  module screw_hole(h)
  {
    cap_h = 3;
    translate([0, 0, -cap_h])
    {
      translate([0, 0, h])
        cylinder(d=5.3+0.6, h=cap_h+eps, $fn=fn(60));
      cylinder(d=3.0+0.6, h=h+2*eps, $fn=fn(60));
    }
  }

  $fn=fn(40);
  side_rounded_cube([l, 12, h1+45], r);

  difference()
  {
    s=[l, 45, h1];
    side_rounded_cube(s, r);
    translate([s.x/2, s.y/2, -12 + h1 + eps])
      screw_hole(h=12);
  }
}

cam_hold();
