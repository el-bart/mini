use <detail/mocks.scad>
include <detail/config.scad>
include <m3d/all.scad>


module pack_connector(mocks=$preview)
{
  module core()
  {
    module half()
    {
      %if(mocks)
        battery_pack_mock();
      s = [8, wall, battery_pack_size.z];
      translate([-s.x/2, battery_pack_size.y/2, 0])
        cube(s);
    }

    translate([0, 0, wall/2])
      half();
    translate([0, 0, -battery_pack_size.z - wall/2])
      half();
    // center piece
    translate([0, wall/2, 0])
      cube([battery_pack_size.x, battery_pack_size.y + wall, wall], center=true);
  }

  intersection()
  {
    translate([0, 0, battery_pack_size.z + wall/2])
      core();
    cylinder(d=d_int, h=2*(battery_pack_size.z + wall), $fn=fn(80));
  }
}


module pack_connector_flat(mocks=$preview)
{
  rotate([-90, 0, 0])
    translate([0, -battery_pack_size.y/2 - wall, 0])
    pack_connector();
}

pack_connector_flat();
