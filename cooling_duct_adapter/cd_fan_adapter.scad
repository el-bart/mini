include <m3d/all.scad>

module fan_adapter()
{
  d_int = 240;
  wall = 1.7;
  h_base = 3;
  d_ext = d_int + 2*wall;

  difference()
  {
    $fn=fn(300);
    cylinder(d=d_ext, h=h_base);
    translate([0, 0, -eps])
      cylinder(d=d_int, h=h_base + 2*eps);
  }
}


fan_adapter();
