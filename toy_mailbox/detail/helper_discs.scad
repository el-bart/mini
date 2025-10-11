include <../m3d/all.scad>
include <config.scad>

module helper_discs()
{
  for(dy=[0, size_ext.y])
    for(dx=[0, size_ext.x])
      translate([dx, dy, 0])
        cylinder(d=35, h=0.2);
}

helper_discs();
