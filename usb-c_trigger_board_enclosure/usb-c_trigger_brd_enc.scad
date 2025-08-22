include <m3d/all.scad>

pcb_s = [11.5, 22.7, 1.2];
usb_s = [8.9, 8.5, 4.5];

spacing = 1;
wall = 1.5;
rounding = wall * 2/3;
size = (wall+spacing)*[2,2,0] + [pcb_s.x, usb_s.z, pcb_s.y];

module pcb_mock()
{
  module body()
  {
    // PCB
    translate([-pcb_s.x/2, 0, 0])
      cube(pcb_s);
    // USB-C socket
    translate([-usb_s.x/2, 0, 0])
      cube(usb_s);
  }

  translate([0, 0, pcb_s.y])
    rotate([-90, 0, 0])
    body();
}


module enc(dl=0, mocks=$preview)
{
  s = size + [0,0,dl];
  translate([-s.x/2, -wall, 0])
  {
    cut_size = s - wall*[2,2,0] + 2*[0,0,eps];
    difference()
    {
      side_rounded_cube(s, rounding, $fn=fn(50));
      translate(wall*[1,1,0] - [0,0,eps])
        cube(cut_size);
    }
  }

  %if(mocks)
    pcb_mock();
}


enc(dl=10);
