use <../m3d/fn.scad>

eps = 0.01;

module pcb_screw_holes()
{
  dd = 2*3/2;
  span_x = (33.8 + dd) / 2;
  span_y = (10.0 + dd) / 2;
  // 2 bottom
  for(ix=[-1,+1])
    translate([ix*span_x, -span_y, 0])
      children();
  // top
  translate([span_x, +span_y, 0])
    children();
}


module pcb()
{
  size = [38, 14.6, 1.5];
  module core()
  {
    translate([-size.x/2, -size.y/2, 0])
      cube(size);
    // bottom sockets
    b_size = [25, 7.6, 7.4];
    translate([-size.x/2+7, -b_size.y/2, -b_size.z])
      cube(b_size);
    // top sockets row
    t_size = [26.6, 5.5, 6.75];
    translate([-size.x/2+6.4, -size.y/2, size.z])
      cube(t_size);
    // hotend socket
    h_size = [5.6, 7.55, 7.3];
    translate([-size.x/2, -size.y/2+5.9, size.z])
      cube(h_size);
  }
  
  difference()
  {
    core();
    // M3 holes slots
    pcb_screw_holes()
      translate([0,0,-eps])
        cylinder(d=3, h=size.z+2*eps, $fn=fn(30));
  }
}


pcb();
