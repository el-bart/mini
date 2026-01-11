use <detail/trigger_board_enc.scad>
include <m3d/all.scad>

module box()
{
  wall = 1.2;
  size_int = [57, 28, 4.5];
  size_ext = size_int + wall*[2,2,1];
  rounding = 2;

  difference()
  {
    side_rounded_cube(size_ext, rounding, $fn=fn(50));
    // interior
    translate(wall*[1,1,1])
      cube(size_int + [0,0,eps]);
  }

  translate([rounding, size_ext.y-wall, 0])
    rotate([0, 90, 0])
    trigger_board_enc(dl=10);
}


module LED_strightening_channel()
{
  wall = 1.5;
  size_int = [25, 9, 2.5];
  size_ext = size_int + wall*[0,2,1];
  difference()
  {
    cube(size_ext);
    translate(wall*[0,1,1] + eps*[-1,0,0])
      cube(size_int + eps*[2,0,1]);
  }
}


box();

translate([0, -15, 0])
  LED_strightening_channel();
