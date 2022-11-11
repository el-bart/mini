use <m3d/fn.scad>

module nozzle()
{
  module oring(d_in, d_r)
  {
    rotate_extrude(angle=360, convexity=20, $fn=fn(120))
      translate([d_in/2+d_r/2, 0, 0])
        circle(d=d_r, $fn=fn(40));
  }

  module body()
  {
    h = 15;
    cylinder(d=26.5, h=h, $fn=fn(100));
    translate([0,0,h])
    {
      h = 24.5;
      cylinder(d=32, h=h, $fn=fn(120));
      translate([0,0,h])
      {
        h = 5;
        cylinder(d1=32, d2=21, h=h, $fn=fn(200));
        translate([0,0,h])
        {
          difference()
          {
            cylinder(d1=21, d2=20, h=10, $fn=fn(200));
            translate([0, 0, 6])
              oring(d_in=17+1.5, d_r=2.5+0.5);
          }
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

rotate([180, 0, 0])
  nozzle();
