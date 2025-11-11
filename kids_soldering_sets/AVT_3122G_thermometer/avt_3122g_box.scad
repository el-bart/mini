include <detail/config.scad>
include <m3d/all.scad>

module box()
{
  difference()
  {
    side_rounded_cube(size_ext, rounding, $fn=fn(30));
    translate(wall*[1,1,1])
      cube(size_int + eps*[0,0,1]);
    // thermomter cable
    translate([14, 9, 0])
      translate(wall*[1,1,0] + [0,0,-eps] + th_d/2*[1,1,0])
      cylinder(d=th_d, h=wall+2*eps, $fn=fn(50));
    // trigger baord slot
    sb = [11.6+1, 4.5+2*1, wall+2*eps];
    translate([0, size_int.y - sb.y, 0])
      translate(wall*[1,1,0] + [0,0,-eps])
      cube(sb);
  }
}


box();
