use <m3d/fn.scad>


module sink_mock(length)
{
  w = 1;
  translate([-w, 0, 0])
    cube([w, length, 120]);
  // TODO... rest
}



sink_mock(length=200);
