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


module pos_hotend_cooler()
{
  translate([0, -20+wall, 27.8+fan_tune_len])
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

  pos_hotend_cooler()
    hotend_cooler_fan();

  translate([20, -28, 20+wall])
    rotate([0, 90, 0])
      filament_cooler_fan();

  translate([-30, 0, 25])
    rotate([90, 90, 0])
      pcb();
}


template();

translate([0, -20, -15])
  pos_hotend_cooler()
    fan_tube();
