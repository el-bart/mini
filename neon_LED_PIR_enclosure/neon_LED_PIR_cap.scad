include <m3d/all.scad>
include <detail/config.scad>
use <detail/main_tube.scad>

cap_wall_spacing = 0.15;
cap_wall_h = 4;
cut = 10.5 + wall;

module cap(mocks)
{
  module cable_mount(l, off)
  {
    x2 = 9.6;
    x1 = 6;
    xoff = (x2-x1)/2;
    d = 3.25;

    module position()
    {
      translate(off)
        rotate([90, 0, 0])
        children();
    }

    module cable_hole_2d()
    {
      translate([xoff, 0])
        square([x1, 3.25]);
      translate([0, wall])
        square([x2, 3+wall]);
    }

    module cable_support_2d()
    {
      ss = [xoff, d-wall];
      module support()
      {
        square(ss);
      }

      for(dx=[0, x2 - ss.x])
        translate([dx, wall])
          support();
    }

    // cut cable slot
    difference()
    {
      children();
      position()
        linear_extrude(l[0])
        cable_hole_2d();
    }

    // add cable support
    position()
      linear_extrude(l[1])
      cable_support_2d();
  }

  module int_walls_2d()
  {
    module frame()
    {
      difference()
      {
        q = wall + cap_wall_spacing;
        offset(delta=-cap_wall_spacing)
          square(dim_int);
        translate(q*[1,1])
          square(dim_int - q*[2,2]);
      }
    }

    difference()
    {
      frame();
      for(dx=[0,1])
        for(dy=[0,1])
          translate([dx*dim_int.x, dy*dim_int.y])
            square(wall*[4,4], center=true);
    }
  }

  module core()
  {
    translate(wall*[1,1,1])
      linear_extrude(cap_wall_h)
      int_walls_2d();

    hull()
      main_tube(wall);

    %if(mocks)
      translate([0, 0, wall])
      main_tube(cap_wall_h - 1);
  }

  cable_mount([cut, cut - wall - cap_wall_spacing], [wall + cap_wall_spacing + wall, cut, 0])
    core();
}


cap(mocks=$preview);
