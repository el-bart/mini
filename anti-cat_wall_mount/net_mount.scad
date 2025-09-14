include <m3d/all.scad>

l = 345;
side = 30;
wall = 3;
mount_hole = [7, 3];
hole_wall_around = 4;
holes_spacing = 35;

holes = round(l / (holes_spacing + mount_hole.x));


module net_mount()
{
  module single_wall()
  {
    side_rounded_cube([l, side+wall, wall], wall, $fn=fn(20));
  }

  module net_mount_holes()
  {
    s = [l, 2*hole_wall_around + mount_hole.y + wall, wall];
    difference()
    {
      side_rounded_cube(s, wall, $fn=fn(20));
      for(i=[0:holes-1])
        translate([holes_spacing/2 + i*(holes_spacing + 2*mount_hole.x/2), 0, 0])
          translate([0, wall + hole_wall_around, -eps])
          side_rounded_cube([mount_hole.x, mount_hole.y, wall+2*eps], 1, $fn=fn(30));
    }
  }

  module strut()
  {
  }

  // mount walls
  {
    translate([0, -side, 0])
      single_wall();
    translate([0, wall, 0])
      rotate([90, 0, 0])
      single_wall();
  }

  // filler for connector rounding
  cube([l, wall, wall]);

  net_mount_holes();
}


net_mount();
