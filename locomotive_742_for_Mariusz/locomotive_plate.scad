include <m3d/math.scad>

module plate()
{
  h = 1;
  depth = 0.75;
  txt_size = 2.3;
  plate_size = [21, 10, h];
  difference()
  {
    translate(-[plate_size.x/2, plate_size.y/2, 0])
    cube(plate_size);
    translate([0, 0, h-depth])
    {
      translate([0, txt_size/2+1, 0])
        linear_extrude(depth+eps)
          text("Mariuszowi w", size=txt_size, halign="center", valign="center");
      translate([0, -txt_size/2-1, 0])
        linear_extrude(depth+eps)
          text("ostatnią drogę", size=txt_size, halign="center", valign="center");
    }
  }
}

rotate([90, 0, 0])
plate();
