use <m3d/fn.scad>
use <mocks/hotend_cooler_fan.scad>
use <mocks/filament_cooler_fan.scad>
use <mocks/pcb.scad>

eps = 0.01;
wall = 1.8;
fan_tune_len = 15;
fan_tune_connect_len = 5;


module fan_tube()
{
  spacing = 1;
  surface_in = [26.1+1, 30, eps];
  surface_out = [40, 40, eps];

  module shape(delta)
  {
    off = delta > 0 ? eps : 0;
    vd = delta * [2,2,0];
    sivd = surface_in  + vd;
    sovd = surface_out + vd;

    // funnel
    hull()
    {
      translate([-sivd.x/2, -delta, off])
        cube(sivd);
      translate([-sovd.x/2, -delta, fan_tune_len-off])
        cube(sovd);
    }
    // adapter
    difference()
    {
      hull()
      {
        translate([-sivd.x/2, -delta, off])
          cube(sivd);
        translate([-sivd.x/2, -delta, -fan_tune_connect_len+off])
          cube(sivd);
      }
      {
        s = [sivd.x - 2*delta, sovd.y, fan_tune_connect_len];
        translate([-s.x/2, -delta-eps, -s.z-eps])
          cube(s + eps*[1,1,1]);
      }
    }
  }

  difference()
  {
    shape(delta=wall);
    shape(delta=0);
  }
}


module box_mount_holes()
{
  // left
  translate([-41.6, 2.94,0])
    children();
  // 2x rigth
  for(dy=[8.2, -21.68])
    translate([34.48, dy, 0])
      children();
}



module pos_hotend_cooler()
{
  translate([0, -20+wall, 27.8+fan_tune_len])
    children();
}


module pos_filament_cooler()
{
  translate([30.8, -20, 20+wall+4])
    rotate([0, 90, 0])
      children();
}


module pos_pcb()
{
  translate([1, 11+1, 44.5])
    rotate([180, 0, 180])
      children();
}


module template()
{
  module carriage()
  {
    translate([0.55, 0, 0])  // centering
      import("ext/carriage.stl");
  }

  module hotend()
  {
    translate([0, -9-(48+8), -1.1-15.9+27.85])    // final alignment
      translate([-13, -0.5, -8.93])  // centering
        import("ext/hotend.stl");
  }

  carriage();
  hotend();

  %if(true)
    pos_hotend_cooler()
      hotend_cooler_fan();

  %if(true)
    pos_filament_cooler()
      filament_cooler_fan();

  // TODO                                               
  %if(true)
    pos_pcb()
      pcb();
}


module enclosure()
{
  module core()
  {
    // right side
    translate([29, -40, 0])
    {
      // plane for screws
      cube([10, 55, wall]);
      // right wall
      cube([wall, 55, 43]);
      // bottom right plane
      translate([-15.5, 0, 0])
        cube([15.5, wall, 43]);
      // front, right panel around fan
      translate([-9, 0, 43-wall])
      {
        cube([9, 55, wall]);
        // mounts for filament cooling fan screws
        for(dz=[-3, -37])
          translate([wall, 0, dz])
            cube([9, 41, 8]);
      }
      // front, right panel around fan
      translate([-9, 0, 43-wall])
        cube([9, 55, wall]);
    }
    // bottom connector
    {
       translate([-50/2-11, -40, 30])
        cube([50+11, wall, 13]);
    }
    // left side
    translate([-29, -40, 0])
    {
      // front, left panel around fan
      translate([-7, 0, 43-wall])
        cube([16, 43.6, wall]);
      // side and bottom
      translate([-7, 0, 0])
      {
        // left, bottom plane
        cube([10, wall, 42]);
        // bottom support against flat plane
        cube([10, 4+8, 2*wall]);
        // side reinforcement
        cube([wall, wall+5, 42]);
      }
    }
    // PCB pannel supports
    translate([0, 2, 33])
    {
      // right (single) support
      translate([15, 0, 0])
        cube([8, 8, 10]);
      // left (dual) support
      translate([-21, 0, 0])
        cube([8, 20, 10]);
    }
    // funnel for air
    translate([0, -20, -15])
      pos_hotend_cooler()
        fan_tube();
    // solids to screw hotend fan to
    {
      d = 8;
      l = 10;
      pos_hotend_cooler()
        hotend_cooler_fan_screw_holes()
          translate(-d/2*[1,1,0] + [0, 0, -l])
            cube([d, d, l]);
    }
  }

  difference()
  {
    core();
    // main mount holes
    translate([0, 0, -eps])
      box_mount_holes()
        cylinder(d=3+0.5, h=wall+2*eps, $fn=fn(30));
    // hotend cooling fan: places for threaded inserts
    {
      lh = 10;
      pos_hotend_cooler()
        hotend_cooler_fan_screw_holes()
          translate([0, 0, -lh-eps])
            cylinder(d=4+0.5, h=lh+2*eps, $fn=fn(50));
    }
    // filement cooling fan: places for threaded inserts
    {
      lf = 9;
      pos_filament_cooler()
        filament_cooler_fan_screw_holes()
          translate([0, 0, -lf-eps])
            cylinder(d=4+0.5, h=lf+3*eps, $fn=fn(50));
    }
    {
      lp = 10;
      pos_pcb()
        pcb_screw_holes()
          translate([0, 0, 1.5-eps])
            cylinder(d=4+0.5, h=lp+3*eps, $fn=fn(50));
    }
  }

  %template();
}


rotate([90, 0, 0])
  enclosure();
