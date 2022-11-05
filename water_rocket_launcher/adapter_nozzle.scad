use <m3d/fn.scad>

module nozzle()
{
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
          cylinder(d1=21, d2=20, h=10, $fn=fn(200));
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
