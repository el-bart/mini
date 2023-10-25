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
}


template();
