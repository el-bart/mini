include <m3d/all.scad>
include <detail/config.scad>

module safe_wall_block()
{
  cube([wall_block_wall, wall_block_len, wall_block_h]);
  cube([wall_block_notch_len, wall_block_wall, wall_block_h]);
}


safe_wall_block();
