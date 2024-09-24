include <detail/config.scad>
include <m3d/math.scad>
use <LED_sensor_cover.scad>

module power_cable_cover(mocks)
{
  int_cut_size = cupboard_cable_cover_ext_size - [2*4*0.4, 0, 8*0.2] + eps*[0,2,1];
  difference()
  {
    translate([-cupboard_cable_cover_ext_size.x/2, 0, 0])
      cube(cupboard_cable_cover_ext_size);
    // internal cut
    translate([-int_cut_size.x/2, -eps, -eps])
      cube(int_cut_size + [0,0,eps]);
  }

  if(mocks)
    translate([0, -led_cover_ext_size.y/2, 0])
      %LED_sensor_cover(mocks);
}


rotate([0 , 180, 0])
  power_cable_cover(mocks=$preview);
