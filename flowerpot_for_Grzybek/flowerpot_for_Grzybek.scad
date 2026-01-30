include <m3d/all.scad>
include <detail/config.scad>

module flowerpot()
{
  module skin()
  {
    module circles()
    {
      for(n=[0:flowerpot_ball_n-1])
        rotate([0, 0, n*(360/flowerpot_ball_n)])
          translate([0, flowerpot_d/2])
          circle(d=flowerpot_ball_d, $fn=fn(30));
    }

    linear_extrude(height=flowerpot_h, twist=flowerpot_ball_rot_angle)
      circles();
    linear_extrude(height=flowerpot_h, twist=-flowerpot_ball_rot_angle)
      rotate([0, 0, 360/flowerpot_ball_n/2])
      circles();
  }

  module bottom_holes()
  {
    for(n=[0:flowerpot_bottom_hole_n-1])
      rotate([0, 0, n*(360/flowerpot_bottom_hole_n)])
        translate([0, flowerpot_d/2/2, -eps])
        cylinder(d=flowerpot_bottom_hole_d, h=flowerpot_bottom+2*eps, $fn=fn(20));
  }

  difference()
  {
    union()
    {
      skin();
      cylinder(d=flowerpot_d, h=flowerpot_h, $fn=fn(100));
    }
    translate([0, 0, flowerpot_bottom])
      cylinder(d=flowerpot_d-2*flowerpot_wall, h=flowerpot_h, $fn=fn(100));
    bottom_holes();
  }
}


flowerpot();
