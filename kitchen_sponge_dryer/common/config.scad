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
