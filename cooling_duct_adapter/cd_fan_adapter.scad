include <m3d/all.scad>

module fan_adapter()
{
  wall = 2.0;

  mount_n = 4;
  mount_size = [5, 10, 8];


  fan_d_int = 240;
  fan_h_base = 27;
  fan_d_ext = fan_d_int + 2*wall;

  conn_h = 170;

  duct_d_ext = 125 - 5;
  duct_h_base = 60;
  duct_d_int = duct_d_ext - 2*wall;

  module fan_base()
  {
    module mounts()
    {
      s = mount_size;

      for(r=[0: 360/mount_n : 360])
        rotate([0, 0, r])
          translate([-mount_size.x/2, fan_d_int/2 + wall/2, 0])
          render()
          difference()
          {
            cube(s);
            translate([0, 0, s.z/2])
              cube([s.x, s.y/2, s.z/2]);
          }
    }

    difference()
    {
      $fn=fn(300);
      cylinder(d=fan_d_ext, h=fan_h_base);
      translate([0, 0, -eps])
        cylinder(d=fan_d_int, h=fan_h_base + 2*eps);
    }

    mounts();
  }

  module connector()
  {
    $fn=fn(300);
    difference()
    {
      cylinder(d1=fan_d_ext, d2=duct_d_ext, h=conn_h);
      translate([0, 0, -eps])
        cylinder(d1=fan_d_int, d2=duct_d_int, h=conn_h+ 2*eps);
    }
  }

  module duct_adapter()
  {
    difference()
    {
      $fn=fn(300);
      cylinder(d=duct_d_ext, h=duct_h_base);
      translate([0, 0, -eps])
        cylinder(d=duct_d_int, h=duct_h_base + 2*eps);
    }
  }

  fan_base();
  translate([0, 0, fan_h_base])
  {
    connector();
    translate([0, 0, conn_h])
      duct_adapter();
  }
}


fan_adapter();
