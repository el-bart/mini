use <m3d/fn.scad>

sink_bump_h = 7.25;
sink_a_rise = 90 - 19.1 + 0.6; // measured on photo - take with a grain of salt...
sink_x_rise = sink_bump_h / tan(sink_a_rise);
sink_x_bottom_start = 28;
sink_x_top_length = 22;
sink_x_base_length = sink_x_bottom_start + 36.5;
sink_x_fall = sink_x_base_length - (sink_x_bottom_start - sink_x_rise - sink_x_top_length);
assert(sink_x_fall > 0);

box_enc_size = [45, 175, 100];


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



% sink_mock(length=200, spacing=0);
