include <m3d/all.scad>

out = 60;
down = 70;
l = 50;

module support()
{
  module core()
  {
    linear_extrude(l)
      polygon([
          [0, down],
          [out, down],
          [0, 0],
      ]);
  }

  module screw_holes()
  {
    screw_len = 25;
    int_d = 3.6 + 0.25;
    ext_d = 8 + 1;
    ext_h = 5;
    driver_d = 11+3;
    wood_wall = 15 - 3;
    int = max(out, screw_len);

    for(dz=[-1,+1])
      translate([0, down - 10 - driver_d/2, l/2 + dz*(l/2 - driver_d)])
        rotate([0, 90, 0])
        translate([0, 0, -wood_wall])
        {
          cylinder(d=int_d, h=int, $fn=fn(50));
          translate([0, 0, wood_wall])
          {
            cylinder(d=ext_d, h=ext_h, $fn=fn(50));
            translate([0, 0, ext_h])
            {
              cylinder(d=driver_d, h=int, $fn=fn(50));
            }
          }
        }
  }

  difference()
  {
    core();
    screw_holes();
  }
}


support();
