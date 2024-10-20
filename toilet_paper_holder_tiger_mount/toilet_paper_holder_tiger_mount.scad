include <m3d/math.scad>
use <m3d/fn.scad>
use <m3d/threaded_inserts/cnc_kitchen.scad>

mount_size = 40.1*[1,1,0] + [0, 0, 10];

base_surround = 6;
base_spacing = 0.2;
base_rounding = 3;

toilet_paper_d_in = 45; // 40-45 [mm]
toilet_paper_d_out = 122; // 120-130 [mm]
toilet_paper_h = 100;

support_rod_h = toilet_paper_d_out/2 + 15;

toilet_paper_rod_y = 25;
toilet_paper_rod_h = toilet_paper_h + 25;


module toilet_paper_mock()
{
  h = toilet_paper_h;
  difference()
  {
    cylinder(d=125, h=h); // upper bound diameter
    translate([0, 0, -eps])
      cylinder(d=40, h=h+2*eps); // lower bound diameter
  }
}


module mount_mock()
{
  s = mount_size;
  translate(-0.5*[s.x, s.y, 0])
    cube(s);
  translate([0, 0, s.z])
    cylinder(d=4, h=10.3, $fn=fn(15));
}


module hex(y, h)
{
  a = 120;
  x = y/2 * 1/sin(a/2);
  for(r=[0, 120, 240])
    rotate([0, 0, r])
      translate(-1/2*[x, y, 0])
        cube([x, y, h]);
}


module support_rod_core()
{
  spc = base_spacing + base_surround;
  s_ext = mount_size + spc*[0,2,1];
  anchor_s = s_ext - base_rounding/2*[2,2,1];
  echo(anchor_s);

  module anchor()
  {
    translate(-0.5*[anchor_s.x, anchor_s.y, 0])
      cube(anchor_s);
  }

  module rod()
  {
    translate([0, 0, mount_size.z + spc - base_rounding])
      rotate([0, 0, 360/6/2])
        hex(y=s_ext.x - base_rounding, h=support_rod_h);
  }

  module base()
  {
    minkowski()
    {
      union()
      {
        anchor();
        rod();
      }
      sphere(d=base_rounding, $fn=fn(30));
    }
  }

  intersection()
  {
    base();
    translate(-0.5*[s_ext.x, s_ext.y, 0])
      cube(s_ext + [0, 0, support_rod_h]);
  }
}


module support_rod(mocks)
{
  module cut()
  {
    spc = base_spacing + base_surround;
    s = mount_size + base_spacing*[0,2,1] + eps*[2,0,1];
    translate(-0.5*[s.x, s.y, 0] - [0,0,eps])
      cube(s);
  }

  module screw_mount()
  {
    translate([0, 0, mount_size.z + base_spacing - eps])
    {
      cylinder(d=4.5, h=12+eps, $fn=fn(30));
      rotate([180, 0, 0])
        ti_cnck_m4_standard(dl=eps);
    }
  }

  module set_screw_hole()
  {
    d_screw = 3.3;
    d = 5;
    assert(d > d_screw);
    h = base_spacing + base_surround + 2*eps;
    dy = mount_size.y/2 - eps;
    dz = mount_size.z - 4.8 - d_screw/2;
    translate([0, -dy, dz])
      rotate([90, 0, 0])
        cylinder(d=d, h=h, $fn=fn(30));
  }

  difference()
  {
    support_rod_core();
    cut();
    screw_mount();
    set_screw_hole();
  }

  %if(mocks)
    mount_mock();
}


module toilet_paper_rod(mocks)
{
  minkowski()
  {
    hex(y=toilet_paper_rod_y - base_rounding, h=toilet_paper_rod_h);
    sphere(d=base_rounding, $fn=fn(30));
  }

  %if(mocks)
    translate([0, 0, (toilet_paper_rod_h - toilet_paper_h)/2])
      toilet_paper_mock();
}


module holder(mocks)
{
  support_rod(mocks);
  translate([-mount_size.x/2 + base_rounding, 0, support_rod_h])
    rotate([0, -90, 0])
      toilet_paper_rod(mocks);
}


rotate([0, 90, 0])
  holder(mocks=$preview);
