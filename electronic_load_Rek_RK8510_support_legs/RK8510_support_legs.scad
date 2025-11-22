include <m3d/all.scad>

module legs()
{
  $fn=fn(60);
  base_h = 1.2;

  wall = 2;
  span = 60;
  d_int = 19.3 + 2;
  d_ext = d_int + 2*wall;
  dy = 20 + d_int/2;

  module leg()
  {
    h = 10 - 5;
    translate([0, 0, base_h])
      difference()
      {
        cylinder(d=d_ext, h=h);
        cylinder(d=d_int, h=h+eps);
      }
  }

  for(dx=[-1,+1])
  {
    off = [dx*span/2, dy, 0];
    translate(off)
      leg();

    // base parts
    hull()
    {
      translate(off)
        cylinder(d=d_ext, h=base_h);
      cylinder(d=20, h=base_h);
    }
  }
}

legs();
