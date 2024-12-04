use <libs/threads.scad>
use <m3d/screw_head_hex.scad>
use <m3d/fn.scad>
include <m3d/math.scad>

// 5l bottle thread is 48mm on the outside - 1 full rotation (h=5mm).
bottle_cap_d_ext = 48;
bottle_cap_d_int = 40.8;
bottle_cap_h = 10;
bottle_cap_wall = 2.5;

// hose has ext. diamater of 31mm
hose_d_ext = 31;
hose_plug_wall = 2;
hose_plug_thread_r = 3;
hose_plug_d_int = hose_d_ext;
hose_plug_d_ext = hose_plug_d_int + 2*hose_plug_wall + 2*hose_plug_thread_r;
hose_plug_h = 12;

// keep link's internal wall angle at 45[deg]
link_h = bottle_cap_d_int - hose_d_ext;


module adapter(mocks)
{
  module bottom()
  {
    module screw_hole()
    {
      pseudo_pitch = 3.25;
      ScrewHole(outer_diam=bottle_cap_d_ext,
                height=bottle_cap_h,
                pitch=3*pseudo_pitch,
                tooth_angle=50,
                //tolerance=0.4,
                tooth_height=pseudo_pitch) // defaults to pitch
        children();
    }

    // this is an oddball screw, that has 3x the pitch, but each separate thread
    // starts at 120deg offset, effectively making it as-if 3 separate threads.
    screw_hole()
      rotate([0, 0, 120])
        screw_hole()
          rotate([0, 0, 120])
            screw_hole()
              screw_head_hex(y=60, h=bottle_cap_h); // TODO: ROUND ME PLZ!
  }

  module link()
  {
    difference()
    {
      cylinder(d1=bottle_cap_d_ext + 2*bottle_cap_wall,
               d2=hose_plug_d_ext,
               h=link_h,
               $fn=fn(50));
      cylinder(d1=bottle_cap_d_ext,
               d2=hose_plug_d_int,
               h=link_h,
               $fn=fn(50));
    }
  }

  module top()
  {
    module screw_hole()
    {
      pseudo_pitch = hose_plug_thread_r * 3/4;
      ScrewHole(outer_diam=hose_plug_d_int + 2*hose_plug_thread_r/2,
                height=hose_plug_h,
                pitch=pseudo_pitch)
        children();
    }

    // internal thread
    difference()
    {
      screw_hole()
        cylinder(d=hose_plug_d_ext, h=hose_plug_h, $fn=fn(50));
      translate([0, 0, -eps])
        cylinder(d=hose_plug_d_int, h=hose_plug_h + 2*eps, $fn=fn(50));
    }

    // front cover
    translate([0, 0, hose_plug_h])
    {
      difference()
      {
        $fn=fn(50);
        cylinder(d=hose_plug_d_ext, h=hose_plug_wall);
        translate([0, 0, -eps])
          cylinder(d=hose_d_ext, h=hose_plug_wall + 2*eps);
      }
    }

    %if(mocks)
      cylinder(d=hose_d_ext, h=hose_plug_h+10, $fn=fn(50));
  }

  bottom();
  translate([0, 0, bottle_cap_h])
  {
    link();
    translate([0, 0, link_h])
      top();
  }
}


adapter(mocks=$preview);
