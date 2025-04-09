include <m3d/all.scad>
use <TLA_conn_straight.scad>
include <detail/config.scad>

module TLA_conn_angle(mocks=false)
{
  arm = [profile_top_size.x, profile_top_size.y, conn_side_depth + (conn_size.x - profile_top_size.x)/2];

  module quarter_circle()
  {
    translate([0, arm.y, 0])
      rotate([90, 0, 0])
      intersection()
      {
        cylinder(r=arm.x, h=arm.y, $fn=fn(50));
        cube(arm.x*[1,1,1]);
      }
  }

  // bottom
  cube(arm);
  // top
  translate([0, 0, arm.z])
  {
    rotate([0, -90, 0])
      cube(arm);
    quarter_circle();
  }

  %if(mocks)
  {
    translate([profile_top_size.x/2, arm.y/2, -conn_side_depth - conn_middle_wall])
      TLA_conn_straight();
    translate([-arm.z + conn_side_depth, arm.y/2, arm.z + profile_top_size.x/2])
      rotate([0, -90, 0])
      TLA_conn_straight();
  }
}

rotate([90, 0, 0])
  TLA_conn_angle(mocks=$preview);
