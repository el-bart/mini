include <m3d/all.scad>

module fan_adapter()
{
  wall = 1.7;
  fan_d_int = 240;
  fan_h_base = 3;
  fan_d_ext = fan_d_int + 2*wall;

  duct_d_ext = 125;
  duct_h_base = 20;
  duct_d_int = duct_d_ext - 2*wall;

  if(0)
  difference()
  {
    $fn=fn(300);
    cylinder(d=fan_d_ext, h=fan_h_base);
    translate([0, 0, -eps])
      cylinder(d=fan_d_int, h=fan_h_base + 2*eps);
  }

  if(1)
  difference()
  {
    $fn=fn(300);
    cylinder(d=duct_d_ext, h=duct_h_base);
    translate([0, 0, -eps])
      cylinder(d=duct_d_int, h=duct_h_base + 2*eps);
  }
}


fan_adapter();
