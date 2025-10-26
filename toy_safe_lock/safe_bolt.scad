include <m3d/all.scad>
include <detail/config.scad>

module safe_bolt()
{
  // safety bolt
  s = [bolt_len, bolt_d, bolt_h];
  translate([-s.x/2, 0, 0])
    difference()
    {
      cube(s);
      cut = [2*wall_block_notch_len, s.y, 2*wall_block_wall];
      translate([-eps, -eps, s.z - cut.z])
        cube(cut + eps*[2,2,1]);
    }
  // key-inset bolt
  s2 = [3, key_insert_len, s.z];
  translate([-s2.x/2, -s2.y, 0])
    cube(s2);
}


safe_bolt();
