include <m3d/all.scad>

module holder()
{
  h = 20;
  space_laptop = 20.5;
  space_desk = 18.8;
  wall_laptop = 3;
  wall_desk = 3.5;
  desk_h = 77;
  holder_len = 100;
  holder_ext = 5;

  module profile()
  {
    square([wall_laptop, holder_len]);
    translate([wall_laptop, 0])
    {
      square([wall_laptop + space_laptop, wall_laptop]);
      translate([space_laptop, 0])
      {
        square([wall_laptop, desk_h]);
        // desk attachment
        translate([0, desk_h])
        {
          square([wall_laptop + space_desk, wall_desk]);
          translate([wall_laptop + space_desk, -30])
            square([wall_desk, 30 + wall_desk]);
        }
      }
    }
  }

  module support_wall()
  {
    r = 1.5;
    translate([-holder_ext, 0, 0])
      side_rounded_cube([holder_ext + r, holder_len, wall_laptop], r, $fn=fn(50));
  }

  linear_extrude(h)
    profile();
  support_wall();
}


holder();
