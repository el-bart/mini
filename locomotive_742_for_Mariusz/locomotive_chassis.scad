module chassis()
{
  intersection()
  {
    translate([0, 0, 17.5])
      rotate([0, 180, 0])
        import("input_stls/742_spodek_fix4.stl");
//    translate(200*[-0.5, -0.5, 0])
//      cube(200*[1,1,1]);
  }
}

chassis();
