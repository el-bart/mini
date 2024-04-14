use <m3d/fn.scad>
include <detail/config.scad>


module bar()
{
  side_h = bar_side_h;
  l = base_size.x + 2*side_h;
  d_ext = bar_d + side_h;
  d_int = bar_d;
  $fn=fn(100);
  cylinder(d1=d_ext, d2=d_int, h=side_h);
  translate([0, 0, side_h])
  {
    cylinder(d=bar_d, h=base_size.x);
    translate([0, 0, base_size.x])
      cylinder(d1=d_int, d2=d_ext, h=side_h);
  }
}


bar();
