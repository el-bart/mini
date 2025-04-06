include <m3d/all.scad>

side = 20;
angle = 25;

module profile_2d()
{
  // hook
  translate([-60, 0])
    square([50+60, side]);
  translate([50, 0])
  {
    hull()
    {
      square([eps, side]);
      rotate([0, 0, -angle])
        square([60, 1]);
    }
  }
  // handle
  translate([-20, -260+side])
    square([side, 260]);
}


module pickax()
{
  slope = 3;

  module side_profile_2d()
  {
    offset(delta=-slope)
      profile_2d();
  }

  module body()
  {
    minkowski()
    {
      linear_extrude(side - 2*slope)
        side_profile_2d();
      sphere(r=slope, $fn=fn(10));
    }
  }

  difference()
  {
    body();
    // rope hole
    translate([-side/2, -260 + side + 12, -slope-eps])
     cylinder(d=10, h=side+2*eps, $fn=fn(40));
    // nose-cut
    translate([82, -25, -slope-eps])
      rotate([0, 0, -angle])
      cube([side, side, side]);
  }
}

pickax();
