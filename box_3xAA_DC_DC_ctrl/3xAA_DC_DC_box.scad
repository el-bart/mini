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
    module rear_support()
    {
      h = min(wall, 2);
      translate([0, -h, -h])
        rotate([90, 0, 0])
          rotate([0, 90, 0])
            linear_extrude(int_size.x)
              polygon([
                [0, h],
                [h, h],
                [h, 0],
              ]);
    }

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
      // Vcc cables slot
      translate([-wall, wall, wall])
        cube([3*wall, 5, 3]);
      // on/off switch slot
      translate([wall+5, ext_size.y-wall, wall])
        cube([20.8-0.5, 3*wall, 12.5+0.2]);
      // 3-state switch for voltage regulation
      translate([ext_size.x-wall-6/2-10, ext_size.y-wall, wall+13/2])
        rotate([-90, 0, 0])
          cylinder(d=6, h=3*wall, $fn=fn(30));
      // output DC wire
      translate([ext_size.x-2*wall, wall, wall])
        cube([3*wall, 5, 3]);
      // 5mm LED slot
      translate([ext_size.x/2, ext_size.y-wall, wall+13/2])
        rotate([-90, 0, 0])
          cylinder(d=5+0.2, h=3*wall, $fn=fn(30));
    }

    translate([wall, ext_size.y-wall, wall+int_size.z-cover_spacing])
      rear_support();
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
