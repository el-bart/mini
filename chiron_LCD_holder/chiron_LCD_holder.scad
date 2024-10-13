include <m3d/math.scad>

pcb_size = [108, 61.5, 1.1];
pcb_cut_pos = [pcb_size.x-3.4, 16.9, 0];
pcb_connectors_size = [9.3, 29, 6.1];

module screen_mock()
{
  // PCB
  difference()
  {
    cube(pcb_size);
    translate(pcb_cut_pos + [0, 0, -eps])
      cube([3.4+eps, 28.5, pcb_size.z+2*eps]);
  }
  // LCD
  translate([11.8, 3.2, pcb_size.z])
    cube([85.66, 55.6, 3.75]);
  // bottom connectors
  translate(pcb_cut_pos - [9.3, 0, 6.1])
    cube(pcb_connectors_size);
}

screen_mock();
