include <detail/config.scad>
include <m3d/math.scad>

N = 3;

module LED_sensor_mock()
{
  size = [8.5, 48, 6];
  translate([0, 0, size.z/2])
    cube(size, center=true);
}

module LED_sensor_cover()
{
  int_cut_size = led_cover_ext_size - [2*3*0.4, 2*3*0.4, 2*0.2];
  cable_cut_size = [7, led_cover_ext_size.y+2*eps, 5];
  difference()
  {
    translate([0, 0, led_cover_ext_size.z/2])
      cube(led_cover_ext_size, center=true);
    // internal cut
    translate([0, 0, int_cut_size.z/2-eps])
      cube(int_cut_size + [0,0,eps], center=true);
    // cable in / out cuts
    translate([0, 0, cable_cut_size.z/2-eps])
      cube(cable_cut_size + [0,0,eps], center=true);
  }

  %LED_sensor_mock();
}


for(n=[0:N-1])
  translate([n*(led_cover_ext_size.x+3), 0, 0])
    rotate([0 , 180, 0])
      LED_sensor_cover();
