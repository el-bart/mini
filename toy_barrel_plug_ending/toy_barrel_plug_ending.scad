include <m3d/all.scad>

module plug()
{
  d_int = 5.1 + 0.4 + 0.5;
  d_ext = 7.0 + 0.1 + 0.5;
  h = 15 + 9.5;

  difference()
  {
    cylinder(d=d_ext, h=h, $fn=fn(50));
    translate([0, 0, 1])
      cylinder(d=d_int, h=h, $fn=fn(50));
  }
}


plug();
