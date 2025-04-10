use <TLA_conn_straight.scad>
include <m3d/all.scad>
include <detail/config.scad>

leg_h = 3;
leg_len = 120;
leg_w = profile_top_size.y;
leg_rounding = 1.25;

module TLA_base_leg(mocks=false)
{
  top_size = leg_w*[1,1,0] + [0,0,conn_side_depth];
  bottom_size = [leg_w, leg_len, leg_h];

  module leg()
  {
    translate([-top_size.x/2, -leg_w/2, 0])
    {
      translate([0,0,leg_h])
        side_rounded_cube(top_size, leg_rounding, $fn=fn(30));
      side_rounded_cube(bottom_size, leg_rounding, $fn=fn(30));
    }
  }

  translate([leg_w/2, 0, 0])
  {
    leg();

    %if(mocks)
    {
      translate([0, 0, leg_h])
        TLA_conn_straight();
      translate([leg_w, 0, 0])
        rotate([0, 0, 180])
        leg();
      translate([-leg_w, 0, 0])
        rotate([0, 0, 180])
        leg();
    }
  }
}


rotate([0, -90, 0])
  TLA_base_leg(mocks=$preview);
