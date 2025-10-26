include <m3d/all.scad>
include <detail/config.scad>

module safe_bolt()
{
  s = [bolt_len, bolt_d, bolt_h];
  translate([-s.x/2, 0, 0])
    cube(s);
  s2 = [3, key_insert_len, s.z];
#
  translate([-s2.x/2, -s2.y, 0])
    cube(s2);
}


safe_bolt();
