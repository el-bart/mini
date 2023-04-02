use <m3d/fn.scad>
use <m3d/screw_head_hex.scad>

eps = 0.01;
pipe_d = 31.7;
pipe_angle_from_vertical_deg = 20.5;
pipe_clearance_rear = 17 + 20;
wall = 10;
h_core = 15;
mount_size = [4, 40, 20];


module blm_rear_core()
{
  d_ext = pipe_d + 2*wall;
  difference()
  {
    // body
    hull()
    {
      // mount cylinder
      cylinder(d=d_ext, h=h_core);
      // main rod
      translate([d_ext/2 + pipe_clearance_rear, -mount_size[1]/2, 0])
        cube(mount_size);
    }
    // seat's mount pipe
    rotate([0, pipe_angle_from_vertical_deg, 0])
      translate([0, 0, -2*h_core])
        cylinder(d=pipe_d + 1, h=5*h_core, $fn=fn(200));
    // light mount
    {
      size = [10, 24+2*2, mount_size[2]+2*eps];
      translate([d_ext/2 + pipe_clearance_rear - size[0] + mount_size[0] - 3, -size[1]/2, -eps])
        cube(size);
    }
    // screw mount
    translate([-d_ext/2, 0, h_core/3])
    {
      // screw hole
      rotate([0, 90, 0])
        cylinder(d=3+0.75, h=20, $fn=fn(40));
      // nut hole
      translate([wall/3, 0, 0])
        hull()
        {
          rotate([0, 90, 0])
          for(dx=[0,h_core])
            translate([dx, 0, 0])
              screw_head_hex_m3(dy=0.5, dh=0.5);
        }
    }
  }
}


module blm_rear_closure()
{
}


blm_rear_core();
