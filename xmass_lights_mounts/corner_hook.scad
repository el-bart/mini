include <m3d/all.scad>
include <detail/config.scad>

module corner_hook(side=20, hook_len=15)
{
  module profile()
  {
    module base()
    {
      module triangle()
      {
        polygon([
            [0,0],
            [0, wall],
            [wall, wall]
        ]);
      }

      // top bar
      translate([0, side-wall])
        polygon([
            [0, 0],
            [wall, wall],
            [wall+side, wall],
            [side, 0],
        ]);
      // left bar
      square([wall, side-wall]);
      // bottom bar
      hull()
      {
        square([hook_len, wall]);
        translate([hook_len, wall/2])
          circle(d=wall, $fn=fn(40));
      }
      // bottom-left enforce corner
      translate([2*wall, wall])
        rotate([0, 0, 90])
        triangle();
      // right bar
      translate([hook_len-wall/2, wall])
        hull()
        {
          translate([wall/2, -wall/2])
            circle(d=wall, $fn=fn(40));
          translate([wall/2, -wall/2 + side-2*wall - cable_hole_dist])
            circle(d=wall, $fn=fn(40));
        }
      // bottom-right enforce corner
      translate([hook_len-wall/2, 2*wall])
        rotate([0, 0, 180])
        triangle();
    }

    difference()
    {
      base();
      translate([0, side])
        circle(r=corner_space_r, $fn=fn(40));
    }
    // around-the-corner side
    intersection()
    {
      translate([0, side])
        difference()
        {
          $fn=fn(50);
          circle(r=corner_space_r + wall);
          circle(r=corner_space_r);
        }
      square(side*[1,1]);
    }
  }

  linear_extrude(height)
    profile();
}


corner_hook();
