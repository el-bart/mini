use <m3d/fn.scad>
include <m3d/math.scad>

module support()
{
  h = 51-1;
  d_in = 8+1;
  d_out = 18;

  module cut_in(deg, off = 0)
  {
    assert(deg >= 0);
    assert(off >= 0);
    if(deg > 90)
    {
      cut_in(90,     off);
      cut_in(deg-90, off + 90);
    }
    else
    {
      s = [eps, d_out+eps, h+2*eps];
      rotate([0, 0, -off])
        hull()
          translate([0, 0, -eps])
          {
            cube(s);
            rotate([0, 0, -deg])
              cube(s);
          }
    }
  }

  difference()
  {
    cylinder(d=d_out, h=h, $fn=fn(50));
    translate([0, 0, -eps])
      cylinder(d=d_in,  h=h+2*eps, $fn=fn(80));
    cut_in(120);
  }
}


support();
