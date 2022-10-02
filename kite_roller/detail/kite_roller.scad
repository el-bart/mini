use <../m3d/screw_head_hex.scad>

eps = 0.01;

module screw_head()          { screw_head_hex_m8(); }
module screw_head_slot(dh=0) { screw_head_hex_m8(0.5, 2*0.2+dh); }


module side_block(left)
{
  module fin()
  {
    translate(-0.5*[1, 2, 0])
    hull()
    {
      cube([1, 2, 5]);
      for(dx=[-1,+1])
        translate(dx*(120/2-1/2)*[1,0,0])
          cube([1, 2, 2]);
    }
  }

  direction = left ? -1 : +1;
  dx_offset = direction * 80/2;
  module core_body()
  {
    // bottom part + edge around it
    difference()
    {
      $fn=360;
      cylinder(d=120+0.1, h=5+3);
      translate([0,0,5])
        cylinder(d=120-1.5, h=5);
    }
    cylinder(d=30, h=5+25, $fn=100);
    // spherical slot around screw head
    translate([dx_offset, 0, 5])
      intersection()
      {
        scale([1,1,0.5])
          sphere(d=30, $fn=100);
        translate([-20, -20, 0])
          cube([40, 40, 6]);
      }
    // fins
    translate([0,0,5])
      for(r=[0:20:180])
        rotate([0, 0, r])
          fin();
  }

  difference()
  {
    core_body();
    // screw slot
    translate([dx_offset, 0, -eps])
    {
      translate([0,0,5])
      {
        screw_head_slot(0.5);
        %screw_head();
      }
      // rod
      cylinder(d=8+0.55, h=100, $fn=50);
    }
    // screw holes in the center block part
    {
      offset = 7;
      h = 10;
      // top
      translate([0, offset, -eps])
      {
        cylinder(d1=10, d2=7, h=h);
        cylinder(d=3+0.7, h=50, $fn=50);
      }
      // bottom
      translate([0, -offset, -eps])
      {
        screw_head_hex_m3(0.5, h);
        cylinder(d=3+0.7, h=50, $fn=50);
      }
    }

    // asymetric cut, to connect 2 parts with friction
    translate([-20, 0, 5+25-10+eps])
      cube([40, 40, 10]);
  }
}


side_block(left=false);
