profile_top_size = [22.2,  (8.15 + 8.20)/2];
profile_base_size = [28.25, 1.1];
profile_offset_r = 0.05;

conn_side_depth = 10;
conn_side_cable_space = 2;
conn_middle_wall = 2;
conn_size = [35, 14, 2*conn_side_depth + 2*conn_side_cable_space + conn_middle_wall];

base_len = 20;
base_side_wall = 3;
base_bottom_wall = 2;

base_hole_spacing = 0.2;
base_d_hole = 4 + base_hole_spacing;
base_d_pin  = 3 + base_hole_spacing;
base_d_spacing = 0.3 / 2;
base_d_ext = max(base_d_pin, base_d_hole) + 2*base_side_wall;
base_hole_extra_len = 5; // extra space for cables
