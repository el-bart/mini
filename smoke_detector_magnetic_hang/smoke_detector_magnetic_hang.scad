include <m3d/all.scad>

layer_h = 0.2;

grid_spacing = 8;
grid_h = 2*layer_h;
grid_w = 1;

magnet_d = 15;
magnet_h = 5;

h = magnet_h + 2*layer_h + grid_h;
detector_mount_d = 50;
wall_mount_d = 85;


module _magnet_slot(dh=eps)
{
  d = magnet_d + 0.1;
  cylinder(d=d, h=h+dh, $fn=fn(100));
}


module _grided_cylinder(d, h)
{
  module grid()
  {
    n = ceil(d/2 / grid_spacing);

    module vertical()
    {
      l = d + 2*1;
      for(i=[-n:1:+n])
        translate(grid_spacing * [i, 0, 0])
          translate([-grid_w/2, -l/2, 0])
          cube([grid_w, l, grid_h]);
    }

    vertical();
    rotate([0, 0, 90])
      vertical();
  }

  // bottom cylinder
  cylinder(d=d, h=h);
  // top finish
  translate([0, 0, h])
  {
    // grid
    intersection()
    {
      grid();
      cylinder(d=d, h=max(h, grid_h));
    }
    // walls around
    difference()
    {
      cylinder(d=d, h=grid_h);
      cylinder(d=d-2*grid_w, h=grid_h+eps);
    }
  }
}

module _vent_hole()
{
  translate([0, 0, -eps])
    cylinder(d=1.5, h=h, $fn=fn(30));
}


module detector_mount()
{
  difference()
  {
    _grided_cylinder(d=detector_mount_d, h=h, $fn=fn(50));
    translate([0, 0, 2*layer_h])
      _magnet_slot();
    _vent_hole();
  }

}


module wall_mount()
{
  difference()
  {
    _grided_cylinder(d=wall_mount_d, h=h, $fn=fn(50));
    translate([0, 0, 2*layer_h])
      _magnet_slot();
    _vent_hole();
  }

}


detector_mount();

translate([detector_mount_d/2 + wall_mount_d/2 + 5, 0, 0])
  wall_mount();
