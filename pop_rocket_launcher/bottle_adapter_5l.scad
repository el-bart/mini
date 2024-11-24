use <libs/threads.scad>
use <m3d/screw_head_hex.scad>
use <m3d/fn.scad>
include <m3d/math.scad>

// 5l bottle thread is 48mm on the outside - 1 full rotation (h=5mm).
bottle_cap_d_ext = 48;
bottle_cap_d_int = 40.8;
bottle_cap_h = 5;
bottle_cap_wall = 2.5;

// 1.5l bottle is 27mm (not strictly needed but useful for connecting a hose)
hose_plug_thread_wall = 1.7 + 0.8;
hose_plug_wall = 2;
hose_plug_h = 12;
hose_d_int = 27;
hose_plug_d_int = hose_d_int - 2*(hose_plug_thread_wall + hose_plug_wall);

// keep link's internal wall angle at 45[deg]
link_h = bottle_cap_d_int - hose_plug_d_int;


module adapter()
{
  module bottom()
  {
    ScrewHole(outer_diam=bottle_cap_d_ext, height=bottle_cap_h)
      screw_head_hex(y=60, h=bottle_cap_h);
  }

  module link()
  {
    difference()
    {
      cylinder(d1=bottle_cap_d_ext + 2*bottle_cap_wall,
               d2=hose_plug_d_int + 2*hose_plug_wall,
               h=link_h,
               $fn=fn(50));
      cylinder(d1=bottle_cap_d_int, d2=hose_plug_d_int, h=link_h, $fn=fn(50));
    }
  }

  module top()
  {
    // TODO: consider replacing threading into the hose with putting hose inside
    difference()
    {
      ScrewThread(outer_diam=hose_d_int, height=hose_plug_h);
      translate([0, 0, -eps])
        cylinder(d=hose_plug_d_int, h=hose_plug_h + 2*eps, $fn=fn(50));
    }
  }

  bottom();
  translate([0, 0, bottle_cap_h])
  {
    link();
    translate([0, 0, link_h])
      top();
  }
}


adapter();
