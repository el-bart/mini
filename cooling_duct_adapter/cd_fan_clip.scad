include <m3d/all.scad>

module fan_clip()
{
  h = 6;
  wall = 5;
  tooth = 15;
  hold_h = 18;
  spread = 6.5;

  module profile_2d()
  {
    square([wall + tooth, wall]);
    translate([-wall, -spread - wall])
      square([wall, spread + wall]);
    translate([0, -spread - wall])
      square([wall + tooth, wall]);
    translate([-wall, 0])
      square([wall, hold_h]);
    translate([-wall - wall, hold_h])
      square([wall + wall, wall]);
  }

  linear_extrude(h)
    profile_2d();
}


fan_clip();
