use<detail/house.scad>
include<detail/common.scad>

module connector(h)
{
  dist = 22;
  difference()
  {
    hull()
      for(i=[-1,+1])
        translate([0, i*dist/2, 0])
          cylinder(r=8, h=wall, $fn=fn(50));
    for(i=[-1,+1])
      translate([0, i*dist/2, -wall])
        cylinder(r=hole_d, h=3*wall, $fn=fn(50));
  }
}


for(i=[0:6])
  translate([i*18, 0, 0])
connector();
