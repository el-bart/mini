include <m3d/all.scad>

module plug()
{
  d_int = 5.1 + 0.2;
  d_ext = 7.0 - 0.2;
  h = 15;

  difference()
  {
    cylinder(d=d_ext, h=h, $fn=fn(50));
    translate([0, 0, 1])
      cylinder(d=d_int, h=h, $fn=fn(50));
  }
}


plug();
