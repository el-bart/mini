use <m3d/threaded_inserts/cnc_kitchen.scad>
use <m3d/fn.scad>
include <m3d/math.scad>

wall = 1.5;
ext_size = [68.9, 48.0, 14.6+2*wall];
int_size = ext_size - wall*[2,2,2];
cover_spacing = 0.4; // in all directions
cover_len = ext_size.y - wall;

screw_d = 3;
screw_holder_size = (1.5*screw_d + 2*wall)*[1,1,0] + [0,0, ext_size.z-wall-cover_spacing];

module cover_profile()
{
  h = wall;
  ll = int_size.x;
  lh = ll - 2*h;
  translate([h, 0])
    polygon([
      [0, 0],
      [h, h],
      [ll-h, h],
      [ll,   0],
    ]);
}


module cover_pos()
{
  translate([0, cover_len-eps, ext_size.z-wall])
    rotate([90, 0, 0])
      children();
}


module cover()
{
  difference()
  {
    linear_extrude(cover_len)
      cover_profile();
    translate([ext_size.x/2, wall+eps, cover_len - screw_holder_size.y/2])
      rotate([90, 0, 0])
        cylinder(d=screw_d+0.5, h=2*(wall+cover_spacing+eps), $fn=fn(30));
  }
}


module box(mocks)
{
  module main_box()
  {
    difference()
    {
      cube(ext_size);
      // interior
      translate(wall*[1,1,1])
        cube(int_size);
      // top slide-groove
      cover_pos()
        linear_extrude(cover_len+eps)
          offset(r=cover_spacing)
            cover_profile();
    }
  }

  module threaded_insert_holder()
  {
    sh = screw_holder_size.z;
    size = screw_holder_size;

    translate([-size.x/2, 0, 0])
      difference()
      {
        cube(size);
        translate([0, 0, sh+eps] + 1/2*[size.x, size.y, 0])
        {
          ti_cnck_m3_short(dl=eps);
          translate([0, 0, -ext_size.z])
            cylinder(d=screw_d+0.5, h=ext_size.z, $fn=fn(30));
        }
      }
  }

  main_box();
  translate([ext_size.x/2, 0, 0])
    threaded_insert_holder();
  %if(mocks)
    cover_pos()
      cover();
}


box(mocks=$preview);

//if(0)
translate([0, -3, 0])
  rotate([90, 0, 0])
    cover();
