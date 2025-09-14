include <m3d/all.scad>

l = 345;
side = 30;
wall = 3;
mount_hole = [7, 3];
hole_wall_around = 4;
holes = 6;

// M3x16
screw_d = 5 + 0.5;
screw_wall = 5;
screw_holes = 2;

side_with_holes_size = [l, 2*hole_wall_around + mount_hole.y + wall, wall];
holes_spacing = l / holes;


module net_mount()
{
  module single_wall()
  {
    side_rounded_cube([l, side+wall, wall], wall, $fn=fn(20));
  }


  module net_mount_holes()
  {
    difference()
    {
      side_rounded_cube(side_with_holes_size, wall, $fn=fn(20));
      for(i=[0:holes-1])
        translate([holes_spacing/2 + i*(holes_spacing), 0, 0])
          translate([-mount_hole.y/2, wall + hole_wall_around, -eps])
          side_rounded_cube([mount_hole.x, mount_hole.y, wall+2*eps], 1, $fn=fn(30));
    }
  }


  module struts()
  {
    module strut()
    {
      translate([0, wall, wall])
        rotate([90, 0, 0])
        rotate([0, 90, 0])
        linear_extrude(wall)
        polygon([
            [0, 0],
            [0, side-wall],
            [side_with_holes_size.y - 2*wall, 0]
        ]);
    }

    for(dx=[0+holes_spacing, l/2-wall/2, l-wall-holes_spacing])
      translate([dx, 0, 0])
        strut();
  }


  module mount_walls()
  {
    translate([0, -side, 0])
      single_wall();
    translate([0, wall, 0])
      rotate([90, 0, 0])
      single_wall();
    // filler for connector rounding
    cube([l, wall, wall]);
  }


  module side_screw_mount_holes()
  {
    s = [screw_wall, side_with_holes_size.y, side + wall - wall];
    module joint()
    {
      off = s.z / (screw_holes+1);
      difference()
      {
        rounded_cube(s, wall/2, $fn=fn(30));
        for(i=[0:screw_holes-1])
          translate([0, 0, off/2 + screw_d/2 + i*off])
            translate([0, s.y/2, wall])
            translate([-eps, 0, 0])
            rotate([0, 90, 0])
            cylinder(d=screw_d, h=s.x+ 2*eps, $fn=fn(50));
      }
    }

    for(dx=[0, l-screw_wall])
      translate([dx, 0, 0])
        joint();
  }


  mount_walls();
  struts();
  net_mount_holes();
  side_screw_mount_holes();
}


net_mount();
