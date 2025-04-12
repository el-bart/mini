include <m3d/all.scad>

wall = 1.5;
size_int = [27, 12.5, 5.5];
size_ext = size_int + wall*[0,2,2];

module USB_C_trigger_board_adapter()
{
  rotate([0, -90, 0])
    difference()
    {
      cube(size_ext);
      translate([-eps, wall, wall])
        cube(size_int + [2*eps,0,0]);
    }
}

USB_C_trigger_board_adapter();
