use <detail/LED_profile.scad>
include <m3d/all.scad>
include <detail/config.scad>

module TLA_conn_straight()
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
  }

  translate([0, 0, conn_size.z/2])
  {
    base();
    %if($preview)
    {
      h = conn_size.z + 2*10;
      translate([0, 0, -h/2])
        linear_extrude(h)
        LED_profile_2d();
    }
  }
}

TLA_conn_straight();
