use <detail/trigger_board_enc.scad>
include <m3d/all.scad>

module box()
{
  wall = 1.2;
  size_int = [85, 41, 12];
  size_ext = size_int + wall*[2,2,1];
  rounding = 2;

  difference()
  {
    side_rounded_cube(size_ext, rounding, $fn=fn(50));
    // interior
    translate(wall*[1,1,1])
      cube(size_int + [0,0,eps]);
    // on/off switch slot
    translate([wall + 56, size_ext.y-wall-eps, wall+2])
      cube([8.5, wall+2*eps, size_int.z+eps]);
  }

  translate([rounding, size_ext.y-wall, 0])
    rotate([0, 90, 0])
    trigger_board_enc(dl=10);
}


box();
