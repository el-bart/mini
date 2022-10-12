eps = 0.01;
N = 2;
M = 1;

module ecd_holder()
{
  difference()
  {
    translate([-8/2, -40/2, 0])
    {
      cube([8, 40, 5+1.5]);
      for(dy=[0, 40-9])
        translate([8, dy, 0])
          cube([9, 9, 1.5]);
    }
    // screw hole
    translate([0, 0, -eps])
      cylinder(d=3.5, h=10, $fn=40);
  }
}

for(iy=[0:M-1])
for(ix=[0:N-1])
  translate([ix*20, iy*45, 0])
    ecd_holder();
