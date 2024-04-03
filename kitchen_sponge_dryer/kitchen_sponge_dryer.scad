use <m3d/fn.scad>
use <m3d/rounded_cube.scad>
include <m3d/math.scad>

wall = 2;
rounding_r = 4;
assert(rounding_r > wall);

sink_bump_h = 7.25;
sink_a_rise = 90 - 19.1 + 0.6; // measured on photo - take with a grain of salt...
sink_x_rise = sink_bump_h / tan(sink_a_rise);
sink_x_bottom_start = 28;
sink_x_top_length = 22;
sink_x_base_length = sink_x_bottom_start + 36.5;
sink_x_fall_start = sink_x_bottom_start + sink_x_rise + sink_x_top_length;
sink_x_fall = sink_x_base_length - sink_x_fall_start;
assert(sink_x_fall_start > 0);
sink_a_fall = atan( sink_bump_h / sink_x_fall );
assert(sink_x_fall_start > 0);

sink_tube_len = 25;
sink_tube_h = 10;
slope_h = 10;

box_enc_size = [45, 175, 100] + [0, 0, sink_bump_h + wall + slope_h];


module sink_mock(length, spacing=0)
{
  w = 1;

  module bottom()
  {
    h = sink_bump_h;
    sbs = sink_x_bottom_start;
    polygon([
      [-spacing, 0],
      [sbs, 0],
      [sbs + sink_x_rise, h],
      [sbs + sink_x_rise + sink_x_top_length, h],
      [sink_x_base_length, 0],
      [sink_x_base_length, -w],
      [-spacing, -w]
    ]);
  }

  // top wall
  translate([-w-spacing, 0, -w-spacing])
    cube([w, length, box_enc_size.z+w+spacing]);
  // bottom part
  translate([0, 0, -spacing])
    rotate([90, 0, 0])
      translate([0, 0, -length])
        linear_extrude(length)
          bottom();
}


module dryer(mocks=false)
{
  spacing_x = 2;
  spacing_y = 0.5;

  module sink_cut_2d()
  {
    h = sink_bump_h + spacing_y;
    sbs = sink_x_bottom_start;
    start_x = sbs - spacing_x;
    end_x = sink_x_base_length + spacing_x;
    polygon([
      [start_x, 0],
      [start_x, h],
      [start_x + sink_x_rise + sink_x_top_length + spacing_x, h],
      [end_x, 0],
      [end_x, -eps],
      [end_x, -eps]
    ]);
  }

  module sink_cut(dy=2*eps)
  {
    translate([0, box_enc_size.y+dy/2, 0])
      rotate([90, 0, 0])
        linear_extrude(box_enc_size.y + dy)
          sink_cut_2d();
  }

  module sink_tube()
  {
    h = sink_x_base_length;
    l = sink_tube_len;
    dx = sink_x_base_length + 2*wall + spacing_x;// + sink_tube_h;

    module base()
    {
      difference()
      {
        // base shape
        resize([sink_tube_h*2, l])
          cylinder(r=sink_tube_h, h=h, $fn=fn(50));
        // take the upper part only
        union()
        {
          s = [sink_tube_h*2, l, h+2*eps];
          translate([-s.x, -s.y/2, -eps])
            cube(s);
        }
      }
    }

    translate([dx, box_enc_size.y/2, 0])
      rotate([0, -90+sink_a_fall, 0])
        base();
  }

  module supported_sink_tube()
  {
    hull()
    {
      sink_tube();
      // bottom
      linear_extrude(eps)
        projection()
          sink_tube();
    }
  }

  module sink_pipe()
  {
    intersection()
    {
      // core block
      difference()
      {
        minkowski()
        {
          supported_sink_tube();
          sphere(r=1.5*wall, $fn=fn(20)); // 150% wall, to compensate for arcs
        }
        sink_tube();
      }
      // limit to sink end
      cube([sink_x_base_length + wall + spacing_x, box_enc_size.y, box_enc_size.z]);
    }
  }

  module main_box()
  {
    dh = sink_x_base_length - box_enc_size.x - wall;
    bottom_h = sink_bump_h + wall;
    int_size = box_enc_size - wall*[2, 2, 0];
    difference()
    {
      // main block with a pipe
      union()
      {
        side_rounded_cube(box_enc_size, rounding_r, $fn=fn(40));
        sink_pipe();
      }
      // internal cut
      hull()
      {
        // main cut-in
        translate([wall, wall, bottom_h + 10 + slope_h])
          side_rounded_cube(int_size, rounding_r-wall, $fn=fn(40));
        // slope part
        intersection()
        {
          sink_tube();
          cube(box_enc_size - [wall, 0, 0]);
        }
      }
      // open the inner wall, too
      sink_tube();
    }
  }

  difference()
  {
    main_box();
    sink_cut();
  }

  %if(false)
    sink_cut();
  %if(mocks)
    sink_mock(length=200, spacing=0);
}


if(false)
  intersection()
  {
    dryer(mocks=true);
    translate([0, box_enc_size.y/2, 0]) cube([sink_x_base_length, box_enc_size.y, box_enc_size.z]);
  }
else
  dryer(mocks=$preview);
