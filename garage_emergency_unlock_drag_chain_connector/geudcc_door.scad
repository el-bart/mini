use <detail/drag_chain_connector.scad>
include <m3d/all.scad>


magnet_d = 15 - 0.2;
magnet_h = 5;
magnet_bottom_wall = 1.0;
magnet_island_d = magnet_d + 2*3;

center_cut_d = 34  + 2*1;
center_cut_h = 11 + 3;
center_d = sqrt(2)*center_cut_d + 2*5;
center_wall = 2.5;
center_mount_cut = 10;
center_mount_chain_span = 17.5 + 0.5;
center_mount_screw_space_d = 4 + 0.5;

arm_span = center_d/2 + magnet_island_d/2;


module door_mount()
{
  module magnet_arms()
  {
    module core()
    {
      cylinder(d=magnet_island_d, h=magnet_h + magnet_bottom_wall, $fn=fn(40));
    }

    module arm(length)
    {
      module magnet_slot(dh=eps)
      {
        cylinder(d=magnet_d + 0.5, h=magnet_h+dh, $fn=fn(80));

        air_escape_len = magnet_bottom_wall + 2*eps;
        translate([0, 0, -air_escape_len + eps])
          cylinder(d=2, h=air_escape_len, $fn=fn(15));
      }

      difference()
      {
        hull()
        {
          core();
          translate([0, length, 0])
            core();
        }
        translate([0, length, magnet_bottom_wall])
          magnet_slot();
      }
    }

    for(r=[-60, +60, 180])
      rotate([0, 0, r])
        arm(arm_span);
  }

  module body()
  {
    base_h = center_cut_h + center_wall;

    module drag_chain_holder()
    {
      wall = 5;
      y = 15 + 2*center_wall;
      column_h = base_h + 12 + 4;
      module screw_holder(dir)
      {
        s = [column_h, y, wall];
        translate([0, center_cut_h, 0])
          rotate([-90, 0, 0])
          translate([(dir>=0)?wall:0, -y, 0])
          rotate([0, -90, 0])
          difference()
          {
            side_rounded_cube(s, 3, $fn=fn(40));
            translate([s.x - center_mount_screw_space_d/2 - 5, s.y/2, -eps])
              cylinder(d=center_mount_screw_space_d, h=wall+2*eps, $fn=fn(50));
          }
      }

      for(dir=[-1,+1])
        translate([dir*center_mount_chain_span/2, 0, 0])
          screw_holder(dir);
    }

    cylinder(d=center_d, h=base_h, $fn=fn(60));
    drag_chain_holder();
  }

  difference()
  {
    union()
    {
      body();
      magnet_arms();
    }
    // bottom cut
    translate(-center_cut_d/2*[1,1,0] - [0,0,eps])
      cube(center_cut_d*[1,1,0] + [0,0, center_cut_h+eps]);
    // cable insertion hole
    translate([-center_mount_chain_span/2, center_cut_d/2-eps, -eps])
    {
      cube([center_mount_chain_span, center_d, center_cut_h + eps]);
      translate([0, 10, 0])
        cube([center_mount_chain_span, center_d, center_cut_h + center_wall + 2*eps]);
    }
  }
}


door_mount();
