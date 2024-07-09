module rear()
{
  translate([0, 61.5, -11.65])
    rotate([90, 0, 0])
      translate([-24, 0, 0])
        import("stl/mosquito_voron_th_rear_cw2.stl");
}

rear();
