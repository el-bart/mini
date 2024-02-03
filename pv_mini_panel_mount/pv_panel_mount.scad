// tripped-down version of toy_satelite_model
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



module pv_panel_mock()
{
  // main body
  cube(pv_size);
  // +/- cables
  for(dz=[ pv_size[2], -1 ])
    translate([pv_size[0]/2 - 1/2, 3, dz])
      cube([1, pv_size[1], 1]);
}


module pv_panel_mount()
{
  module pv_holder()
  {
    pv_pos_h = pv_mount_size[2]-pv_size[2]-0.5;
    extra_h = 2;
    difference()
    {
      cube(pv_mount_size + [0, 0, extra_h]);
      // panel cut-in
      translate([1, 1, pv_pos_h])
        cube(pv_mount_size - 2*pv_wall_side*[1,1,0] + [0, 0, extra_h]);
      // bottom cable cut-in
      translate([pv_size[0]/2 +1/2, pv_wall_side+pv_spacing, pv_pos_h-1])
        cube([3, pv_size[1]+pv_cable_space, 1+5]);
    }
    translate([1, 1, pv_pos_h] + pv_spacing*[1,1,0])
      %pv_panel_mock();
  }

  translate([pv_mount_block_size[0], 0, 0])
    pv_holder();
}

for(i=[0:1])
  translate([0, i*(pv_mount_size[1]+2), 0])
    pv_panel_mount();
