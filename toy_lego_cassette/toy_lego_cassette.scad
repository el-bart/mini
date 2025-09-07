include <m3d/all.scad>

r = 1;
logo_h = 1;
size = [64, 48, 9.6 - logo_h];

module cassette()
{
  module logo()
  {
    translate([-3.5, -3.5, size.z])
      linear_extrude(logo_h)
      resize([size.x, size.y])
      import("pic/cassette_logo.svg");
  }
  side_rounded_cube(size, r, $fn=fn(30));
  logo();
}


cassette();
