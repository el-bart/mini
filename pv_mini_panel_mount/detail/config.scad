eps = 0.01;
magnet_size = [5,5,1];
magnet_slot_size = magnet_size + 0.5*[0,1,0] + eps*[0,0,1];
pv_size = [52, 19, 0.4];
pv_wall_side = 1;
pv_wall_bottom = 2;
pv_spacing = 1;
pv_cable_space = 4;
pv_mount_size = pv_size +
                2*pv_wall_side*[1,1,0] +
                2*pv_spacing*[1,1,0] +
                [0, pv_cable_space, 0] +
                [0, 0, pv_wall_bottom];
pv_mount_block_size = [magnet_size[0]+1, magnet_size[1]+2*(0.5/2+1), 7];
main_block_size = [30, 30, pv_size[0]+10];
main_wall = 1.3;
