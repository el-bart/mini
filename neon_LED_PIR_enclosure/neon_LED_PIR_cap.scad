include <m3d/all.scad>
include <detail/config.scad>
use <detail/main_tube.scad>

cap_wall_spacing = 0.15;
cap_wall_h = 4;

module cap(mocks)
{
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

  translate(wall*[1,1,1])
    linear_extrude(cap_wall_h)
    int_walls_2d();

  hull()
    main_tube(wall);

  %if(mocks)
    translate([0, 0, wall])
    main_tube(cap_wall_h - 1);
}


cap(mocks=$preview);
