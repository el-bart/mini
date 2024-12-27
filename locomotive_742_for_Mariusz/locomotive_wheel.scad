module wheel()
{
  intersection()
  {
    translate([0, 0, 5.25])
      rotate([-90, 0, 0])
        import("input_stls/kolonovy.stl");
    cube(20*[1,1,1]);
  }
}

wheel();
