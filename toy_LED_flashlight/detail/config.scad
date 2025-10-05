battery_pack_size = [25, 13.4, 53.6];
switch_slot = [20.2, 12.5];

wall = 1.6;
d_int = sqrt(battery_pack_size.x*battery_pack_size.x + battery_pack_size.y*battery_pack_size.y) + 0.5;
d_ext = d_int + 2*wall;
