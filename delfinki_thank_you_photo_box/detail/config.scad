photo_size = [100, 150, 20]; // TODO: OZ is yet to be determined - placeholder for now
photo_spacing = 3*[1,1,0] + [0,0,2];
walls = [8,8,3];
roundings = 2;
corner_r = walls.x/2;

size_int = photo_size + photo_spacing;
size_ext = size_int + walls;

magnet_size = [5,5,1];
magnet_spacing = 0.5;
