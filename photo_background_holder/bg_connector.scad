use <m3d/fn.scad>
use <detail/screw_slot.scad>

eps = 0.01;


module nail_slot(ddh=0)
{
  spacing = 0.3;
  l = 24.2 + ddh + spacing;
  din = 1.4 + spacing;
  dout = 3.25;
  dh = 0.8;

  translate([0, 0, dh/2])
  rotate([180, 0, 0])
  {
    cylinder(d=din, h=l, $fn=fn(30));
    cylinder(d=dout, h=dh, $fn=fn(35));
  }
}


module bg_connector(wall, dx, screws, nails)
{
  spacing = 0.6;
  s_wood = (15+spacing)*[1, 1]; // square part cross-section
  r_wood = 10; // diameter of Round part
  core_size = [10+2*dx, wall+s_wood[0], 2*wall+s_wood[1]];
  // main body
  difference()
  {
    translate([-core_size[0]/2, 0, 0])
      cube(core_size);
    // wood slots
    translate([0, wall, wall])
    {
      // square wood slot
      translate([-2*dx+eps, 0, 0])
        cube([2*dx, s_wood[0]+eps, s_wood[1]]);
      // round wood slot - top
      translate([0, s_wood[0]-r_wood/2, core_size[2]-2*wall-r_wood])
        cube([2*dx, r_wood/2+eps, r_wood]);
      // round wood slot - round part
      translate(r_wood/2*[0, 1, 1] + [0, s_wood[0]-r_wood, s_wood[1]-r_wood])
        rotate([0, 90, 0])
          cylinder(d=r_wood, h=2*dx, $fn=fn(50));
    }
    // screw slots
    for(i=[1:screws])
    {
      hole_dist = core_size[0]/2/(screws);
      translate([0, core_size[1]-s_wood[0]/2, core_size[2]+eps])
        translate([-core_size[0]/2-hole_dist/2 + i*hole_dist, 0, 0])
          screw_slot(20);
    }
    // nails slots
    for(i=[1:nails])
    {
      hole_dist = core_size[0]/2/(nails);
      translate([0, core_size[1]-r_wood/2, core_size[2]+eps])
        translate([-hole_dist/2 + i*hole_dist, 0, 0])
          nail_slot(20);
    }
  }
}


rotate([0, 90, 0])
  bg_connector(wall=7, dx=50, screws=2, nails=3);
