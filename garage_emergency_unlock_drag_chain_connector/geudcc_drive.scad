use <detail/drag_chain_connector.scad>
include <m3d/all.scad>

rod_d = 8; // no spacing on purpose - it should be a slight under-fit
dist_x = 15.5;
dist_y = 11;

dc_head_area = 17.5*[1,1];

screw_d = 3.5;
rod_bottom_wall = 3;
rod_side_wall = screw_d + 2;
base_h = 4 + 1; // threaded insert len + some...
boom = rod_side_wall + rod_d + rod_side_wall + dist_x + dist_y;
mount_len = 40;
rod_base_h = rod_bottom_wall + rod_d/2 - 0.5; // leave a bit space, so that print can climp tight


module screw_slots()
{
  module screw_slot()
  {
    translate(screw_d/2*[0,0,0] + [0,0,-eps])
      cylinder(d=screw_d, h=rod_base_h+2*eps, $fn=fn(60));
  }

  y_off = 3;
  x_off = 0.5;

  for(dx = [rod_side_wall - screw_d/2 - x_off,
            rod_side_wall + rod_d + screw_d/2 + x_off])
    for(dy = [screw_d/2 + y_off,
              mount_len - screw_d/2 - y_off])
      translate([dx, dy, 0])
        screw_slot();
}


module rod_mount()
{
  module rod_slot()
  {
    translate([rod_side_wall, 0, rod_bottom_wall])
      translate(rod_d/2*[1,0,1])
      rotate([-90, 0, 0])
      translate([0, 0, -2])
      cylinder(d=rod_d, h=mount_len+2*2, $fn=fn(60));
  }

  difference()
  {
    children();
    rod_slot();
    screw_slots();
  }
  %if($preview)
    rod_slot();
}


module rod_base_cube()
{
  cube([rod_side_wall + rod_d + rod_side_wall, mount_len, rod_base_h]);
}


module drive_mount_top()
{
  rod_mount()
    rod_base_cube();
}


module drive_mount_bottom()
{
  module boom()
  {
    module top_boom()
    {
      s_top = [boom, dc_head_area.y, base_h];
      translate([s_top.x - dc_head_area.x/2, s_top.y + mount_len - dc_head_area.y, s_top.z])
        drag_chain_connector_holes(dl=base_h)
        translate(-s_top + [dc_head_area.x/2, 0, 0])
        cube(s_top);
    }

    module side_boom()
    {
      boom_short = boom - dc_head_area.x - 3;
      cube([boom_short, mount_len, base_h]);
    }

    rod_base_cube();
    translate([0, mount_len, base_h])
      rotate([180, 0, 0])
      {
        top_boom();
        side_boom();
      }
  }

  rod_mount()
    boom();

  %if($preview)
    translate([rod_side_wall + rod_d + rod_side_wall, 0, 2*rod_base_h+1])
    rotate([0, 180, 0])
    drive_mount_top();
}


drive_mount_bottom();

translate([0, mount_len + 5, 0])
  drive_mount_top();
