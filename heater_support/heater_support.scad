module _main_leg(fi)
{
  fi2=fi+2;
  hull()
  {
    for(i=[0,1])
      translate(i*[2*77+90-38/2*2, 0, 0])
        difference()
        {
          sphere(r=fi/2, $fn=200);
          translate(fi2/2*[-1, -1, -1])
            cube(fi2*[1, 1, 0.5]);
        }
  }
}

module _screw_hole()
{
  translate([77-38/2, 0, -1])
  {
    cylinder(r=(3.5+1)/2, h=38/2+1+2, $fn=20);
    cylinder(r=(7.5+1)/2, h=38/2+1-2, $fn=30);
  }
}

module _screw_hole_long()
{
  translate([77-38/2, 0, -1])
  {
    hull()
    {
      for(i=[0:1])
        translate(i*[4, 0, 0])
          cylinder(r=(3.5+1)/2, h=38/2+1+2, $fn=20);
    }
    hull()
    {
      for(i=[0:1])
        translate(i*[4, 0, 0])
          cylinder(r=(7.5+1)/2, h=38/2+1-2, $fn=30);
    }
  }
}

module heater_support()
{
  difference()
  {
    union()
    {
      difference()
      {
        union()
        {
          _main_leg(38);
          // center mount
          translate([-38/2, -25/2, 0] + [77,0,0])
            cube([90, 25, 38/2+1]);
        }
        _main_leg(38-6);
      }
    }
    translate([(90-42)/2, 0, 0])
    {
      _screw_hole();
      translate([38, 0, 0])
        _screw_hole_long();
    }
  }
}

for(i=[0:1])
  translate(i*[0, 45, 0])
    heater_support();
