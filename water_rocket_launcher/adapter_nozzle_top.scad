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
    h = 5;
    cylinder(d1=32, d2=21, h=h, $fn=fn(200));
    translate([0,0,h])
    {
      difference()
      {
        cylinder(d=16+5, h=10, $fn=fn(200));
        translate([0, 0, 6])
        {
          d_in = 17-0.5;
          d_r = 2.5;
          oring_slot(d_in=d_in, d_r=d_r, d_ext=d_in+1.5, d_r_ext=d_r+0.75);
          %oring(d_in=d_in, d_r=d_r);
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
