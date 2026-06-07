photo_size = [100, 150, 150]; // TODO: OZ is yet to be determined - placeholder for now
photo_spacing = 4*[1,1,0] + [0,0,2];
walls = [8,8,4];
roundings = 2;
corner_r = walls.x/2;

size_int = photo_size + photo_spacing;
size_ext = size_int + 2*walls;

box_cut_edge_h = 10;
box_cut_h = walls.z + photo_size.z + photo_spacing.z - box_cut_edge_h;
box_cut_spacing = 0.5;

magnet_size = [5,5,1];
magnet_spacing = 0.5;
