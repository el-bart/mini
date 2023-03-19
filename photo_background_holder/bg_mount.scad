use <m3d/fn.scad>

eps = 0.01;


module screw_slot(ddh=0)
{
  spacing = 0.3;
  l = 24.3 + ddh + spacing;
  din = 3.5 + spacing;
  dout = 8.5;
  dh = 4;

  rotate([180, 0, 0])
  {
    cylinder(d=din, h=l, $fn=fn(30));
    cylinder(d1=dout, d2=din, h=dh, $fn=fn(35));
  }
}




module bg_mount(wall, dx, screws)
{
  spacing = 0.6;
//  is_size = [10.1+spacing, 25+spacing, 42-29+spacing];
  wood = (15+spacing)*[1, 1];
  core_size = [10+2*dx, wall+wood[0], 2*wall+wood[1]];
//  core_size = [
//  insert_slot(is_size);
  difference()
  {
    translate([-core_size[0]/2, 0, 0])
      cube(core_size);
    // wood slot
    translate([-(4*dx)/2, wall, wall])
      cube([4*dx, wood[0]+eps, wood[1]]);
    // screw slots
    for(i=[1:screws])
    {
      hole_dist = core_size[0]/(screws);
      translate([0, core_size[1]-wood[0]/2, core_size[2]+eps])
        translate([-core_size[0]/2-hole_dist/2 + i*hole_dist, 0, 0])
          screw_slot(20);
    }
  }
}


bg_mount(wall=7, dx=50, screws=4);
//screw_slot();
