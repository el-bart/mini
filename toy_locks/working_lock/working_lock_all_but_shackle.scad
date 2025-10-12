translate([60, -10, 1.3])
  import("key_hole.stl");

translate([-10, 20, 0])
  import("key_v3.stl");

translate([80, 0, 0])
{
  import("layer_1_top.stl");

  translate([120, 0, 0])
    import("layer_2.stl");

  translate([0, 60, 0])
    import("layer_3.stl");

  translate([120, 60, 0])
    import("layer_4.stl");

  translate([120, 120, 0])
    import("layer_5_bottom.stl");
}

translate([95, 110, 0])
  import("shackle_latch_spring.stl");

translate([-55, 0, 0])
  import("shackle_retainer_pin.stl");

// NOTE: this has to be printed separately, due to a big brim needed at the bottom
//import("shackle.stl");
