include <m3d/all.scad>

module fan_adapter()
{
  wall = 1.7;
  fan_d_int = 240;
  fan_h_base = 3;
  fan_d_ext = fan_d_int + 2*wall;

  difference()
  {
    $fn=fn(300);
    cylinder(d=fan_d_ext, h=fan_h_base);
    translate([0, 0, -eps])
      cylinder(d=fan_d_int, h=fan_h_base + 2*eps);
  }
}


fan_adapter();
