use <detail/LED_profile.scad>
include <m3d/all.scad>
include <detail/config.scad>

module TLA_conn_straight(mocks=false)
{
  module base()
  {
    difference()
    {
      cube(conn_size, center=true);
      // profile slots
      for(dz=[conn_middle_wall/2, -conn_size.z - conn_middle_wall/2])
        translate([0, 0, dz])
        {
          // ptofile slot
          linear_extrude(conn_size.z)
            LED_profile_slot_2d();
          // cable slots
          s = [4, conn_size.y, conn_size.z+2*eps];
          translate([-s.x/2, 0, 0])
            cube(s);
        }
    }
    // extra supports, to leave some space for power cables at the bottom
    for(dx=[-1,+1])
      translate([dx*conn_size.x/3, 0, 0])
        cube([conn_size.x/3, conn_size.y, conn_middle_wall + 2*conn_side_cable_space], center=true);
  }

  translate([0, 0, conn_size.z/2])
  {
    base();
    %if(mocks)
    {
      h = conn_size.z + 2*10;
      translate([0, 0, -h/2])
        linear_extrude(h)
        LED_profile_2d();
    }
  }
}

TLA_conn_straight(mocks=$preview);
