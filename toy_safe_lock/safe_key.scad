use <detail/key_profile.scad>
include <m3d/all.scad>
include <detail/config.scad>

rounding = 1.5;

module key_upright()
{
  module general_body()
  {
    for(dz=[0:ken_teeth-1])
      translate([0, 0, 1+dz*(ken_tooth_len+key_tooth_spaceing)])
        linear_extrude(ken_tooth_len)
        key_profile();
    // main rod
    cylinder(d=key_d, h=key_total_len, $fn=fn(40));
    // top finish
    minkowski()
    {
      h = key_d - 2*rounding/2;
      translate([-h/2, 0, key_total_len])
        rotate([0, 90, 0])
        cylinder(d=20, h=h, $fn=fn(50));
      sphere(d=rounding, $fn=fn(20));
    }
  }

  difference()
  {
    general_body();
    translate([key_d/2 - 0.1, -60/2, -eps])
      cube([key_d, 60, 2*key_total_len+2]);
  }
}


module key()
{
  translate([0, 0, key_insert_d/2])
    rotate([0, 90, 0])
    key_upright();
}


key();
