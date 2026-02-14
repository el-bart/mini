include <m3d/all.scad>

module box()
{
  pcb_h = 1.55;

  wall = 1.5;
  spacing = 0.1;
  size_int = [153, 27, 110] + spacing*[2,2,0] + [0,0,pcb_h];
  size_ext = size_int + wall*[2,2,1];

  d_ref = 3.9;
  dist_d_d = 142.42;
  dist_c_c = dist_d_d + 2*d_ref/2;

  module screw_mount(dir)
  {
    difference()
    {
      ss = 9.5;
      s = [ss, ss, 20];
      r = 1;
      translate([0, 0, -s.z])
      {
        difference()
        {
          translate(-0.5*[s.x, s.y, 0])
            side_rounded_cube(s, r, $fn=fn(30));
          translate([0, 0, s.z+eps])
            ti_cnck_m3_standard();
          translate([0, 0, 2*0.6])
            cylinder(d=3.6, h=s.z, $fn=fn(50));
        }
        // bottom rounding
        translate(-0.5*[s.x, s.y, 0])
          hull()
          {
            side_rounded_cube([s.x, s.y, eps], r, $fn=fn(30));
            translate([s.x/2 + dir*(s.x/2-r), s.y/2, -s.z])
              sphere(r=r, $fn=fn(50));
          }
      }
    }
  }

  translate([-size_ext.x/2, 0, 0])
    difference()
    {
      side_rounded_cube(size_ext, 1, $fn=fn(50));
      translate(wall*[1,1,1])
        cube(size_int + [0,0,eps]);
    }

  for(dir=[-1, +1])
    translate([dir*dist_c_c/2, size_ext.y/2, size_ext.z - pcb_h])
      screw_mount(dir);
}

box();
