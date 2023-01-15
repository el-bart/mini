use <m3d/fn.scad>

module oring_slot(d_ext, h, groove)
{
  translate([0, 0, -h/2])
    rotate_extrude(angle=360, convexity=20, $fn=fn(180))
      translate([d_ext/2-groove, 0, 0])
        square([h, h]);
}


module nozzle()
{
  module body()
  {
    h1 = 5;
    d = 21;
    cylinder(d1=32, d2=d, h=h1, $fn=fn(200));
    translate([0,0,h1])
    {
      h2 = 18;
      difference()
      {
        cylinder(d=d, h=h2, $fn=fn(200));
        translate([0, 0, h2/2])
        {
          d_r = 2.5;
          oring_slot(d_ext=d, h=d_r, groove=2.5/2);
        }
      }
    }
  }

  difference()
  {
    body();
    translate([0,0,-1])
      cylinder(d=9, h=60, $fn=fn(50));
  }
}

nozzle();
