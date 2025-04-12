include <m3d/all.scad>

side = 20;
angle = 25;

module profile_2d()
{
  scale_y = 0.75;
  // hook
  translate([0, -200*scale_y]/2)
    scale([1, scale_y])
    difference()
    {
      $fn=fn(350);
      circle(d=200);
      translate([0, -50])
        circle(d=250);
    }
  // handle
  translate([-20/2, -260])
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
    translate([0, -260 + 12, -slope-eps])
     cylinder(d=10, h=side+2*eps, $fn=fn(40));
    // nose-cut
    translate([82, -25, -slope-eps])
      rotate([0, 0, -angle])
      cube([side, side, side]);
  }
}

pickax();
