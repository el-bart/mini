include <detail/config.scad>
//
//via_d = 60; // [mm]
//via_h = 28; // [mm]
//wall = 1.6; // [mm]
//top = wall / 2; // [mm]


module desk_via_cover()
{
  difference()
  {
    union()
    {
      cylinder(d=top_d, h=top_h);
      translate([0, 0, top_h])
        cylinder(d=via_d, h=via_h);
    }
    translate([0, 0, top_h])
      cylinder(d=via_d-2*wall, h=via_h+eps);
  }
}


desk_via_cover();
