use <m3d/fn.scad>

module oring(d_in, d_r)
{
  rotate_extrude(angle=360, convexity=20, $fn=fn(120))
    translate([d_in/2+d_r/2, 0, 0])
      circle(d=d_r, $fn=fn(40));
}

module oring_slot(d_in, d_r, d_ext, d_r_ext)
{
  rotate_extrude(angle=360, convexity=20, $fn=fn(120))
    hull()
    {
      translate([d_in/2+d_r/2, 0, 0])
        circle(d=d_r, $fn=fn(40));
      translate([d_ext/2+d_r_ext/2, 0, 0])
        circle(d=d_r_ext, $fn=fn(40));
    }
}


module nozzle()
{
  module body()
  {
    h = 15;
    cylinder(d=26.5, h=h, $fn=fn(100));
    translate([0,0,h])
    {
      h = 140-97-16-5; //24.5;
      cylinder(d=32, h=h, $fn=fn(120));
    }
  }

  difference()
  {
    body();
    translate([0,0,-1])
      cylinder(d=9, h=60, $fn=fn(50));
  }
}

rotate([180, 0, 0])
  nozzle();
