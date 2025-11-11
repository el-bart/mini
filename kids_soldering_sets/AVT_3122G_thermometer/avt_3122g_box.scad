include <detail/config.scad>
include <m3d/all.scad>

wall = 1.5;
size_int = [52-2*wall, 27, 60];
size_ext = size_int + wall*[2,2,1];
th_d = 4;
rounding = 1;

screw_d = 2 + 0.75;
mount_d = screw_d * 2*1;
mount_h = 5;


module box()
{
  module main()
  {
    difference()
    {
      side_rounded_cube(size_ext, rounding, $fn=fn(30));

      // interior
      translate(wall*[1,1,1])
        cube(size_int + eps*[0,0,1]);

      // thermomter cable
      translate([14, 9, 0])
        translate(wall*[1,1,0] + [0,0,-eps] + th_d/2*[1,1,0])
        cylinder(d=th_d, h=wall+2*eps, $fn=fn(50));

      // trigger baord slot
      sb = [11.6+1, 4.5+2*1, wall+2*eps];
      translate([0, size_int.y - sb.y, 0])
        translate(wall*[1,1,0] + [0,0,-eps])
        cube(sb);
    }
  }

  module screw_mounts()
  {
    module mount_positions()
    {
      // dx=54
      // h=10
      span = 54;
      translate([span/2-wall, 0, 0])
        for(dx=[-1,+1])
          translate([dx*span/2, wall+10, 0])
            children();
    }

    module screw_mount()
    {
      module unified()
      {
        translate([0, 0, size_ext.z - mount_h - mount_d])
          mount_positions()
          hull()
          {
            translate([0, 0, mount_d])
              cylinder(d=mount_d, h=mount_h, $fn=fn(30));
            cylinder(d=0.5, h=mount_d, $fn=fn(30));
          }
        main();
      }

      module holes()
      {
        h = mount_d/2;

        translate([0, 0, size_ext.z - h - 4 + eps])
          mount_positions()
          {
            translate([0, 0, h])
              cylinder(d=3.1, h=4, $fn=fn(30));
            cylinder(d=screw_d, h=h, $fn=fn(30));
          }
      }

      difference()
      {
        unified();
        holes();
      }
    }

    screw_mount()
      children();
  }

  screw_mounts()
    main();
}


box();
