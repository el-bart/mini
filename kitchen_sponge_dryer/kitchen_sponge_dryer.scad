use <m3d/fn.scad>



module sink_mock(length, spacing=0)
{
  w = 1;

  module bottom()
  {
    h = 7.25;
    a_rise = 90-19.1+0.6;
    x_rise = h / tan(a_rise);
    polygon([
      [0, 0],
      [28, 0],
      [28+x_rise, h],
      [28+x_rise+22, h],
      [28+36.5, 0],
      [28+36.5, -w],
      [0, -w]
    ]);
  }

  translate([-w-spacing, 0, -w-spacing])
    cube([w, length, 120+w+spacing]);
  rotate([90, 0, 0])
    translate([0, 0, -length])
      linear_extrude(length)
        bottom();
}



% sink_mock(length=200);
