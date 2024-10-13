include <m3d/math.scad>

wall = 2;
pcb_size = [108, 61.5, 1.1];
pcb_cut_pos = [pcb_size.x-3.4, 16.9, 0];
pcb_connectors_size = [9.3, 29, 6.1];

module screen_mock()
{
  module full_pcb()
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

  translate([0, 0, pcb_connectors_size.z])
    full_pcb();
}

module box(mocks)
{
  dh = 1;
  ext_size = [pcb_size.x, pcb_size.y, wall + pcb_connectors_size.z + dh];
  int_size = ext_size - wall*[2,2,0];
  module body()
  {
    difference()
    {
      cube(ext_size);
      translate(wall*[1,1,1])
        cube(int_size);
    }
  }

  difference()
  {
    dy = 4;
    body();
    translate([-wall, 0, wall])
      translate(pcb_cut_pos - [0, dy/2, 0])
        cube(pcb_connectors_size + [0, dy, dh + eps]);
  }

  %if(mocks)
    translate([0, 0, wall+dh])
      screen_mock();
}

box(mocks=$preview);
