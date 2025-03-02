include <m3d/all.scad>

module wheel()
{
  d_ext = 30;
  h = 7.5;
  wall = 0.8;
  
  module outer_rim()
  {
    difference()
    {
      cylinder(d=d_ext, h=h, $fn=fn(80));
      translate([0, 0, wall])
        cylinder(d=d_ext-2*wall, h=h, $fn=fn(80));
      translate([0, 0, -eps])
        cylinder(d=d_ext-2*4*wall, h=h, $fn=fn(80));
    }
  }

  module center_cross()
  {
    intersection()
    {
      union()
      {
        for(a=[0:90:360])
          rotate([0,0,a])
            translate([-wall/2, 0, 0])
              cube([wall, d_ext/2, h]);
      }
      cylinder(d=d_ext-2*wall/2, h=h, $fn=fn(80));
    }
  }
  
  module axle_slot()
  {
    difference()
    {
      union()
      {
        cylinder(d=5, h=h, $fn=fn(30));
        children();
      }
      translate([0, 0, wall])
        cylinder(d=2.1, h=h, $fn=fn(50));
    }
  }

  axle_slot()
  {
    outer_rim();
    center_cross();
  }
}


wheel();
