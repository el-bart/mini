use <mocks/hotend_cooler_fan.scad>
use <mocks/filament_cooler_fan.scad>

wall = 1.8;

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

  translate([0, -20, 27.8+15])
    hotend_cooler_fan();

  translate([20, -20, 20+wall])
    rotate([0, 90, 0])
      filament_cooler_fan();
}


template();
