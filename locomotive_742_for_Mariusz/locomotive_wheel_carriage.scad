module wheel_carriage()
{
  translate([-60.5, -34, 0])
    rotate([0, 0, 0])
      import("input_stls/742_podvozek_fix4.stl");
}

wheel_carriage();
