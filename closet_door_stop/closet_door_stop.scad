N=2;
M=2;
spacing=3;

module door_stop()
{
  span=10;
  difference()
  {
    union()
    {
      scale([0.5, 1, 1])
        rotate([-90, 0, 0])
          cylinder(r=10, h=span, $fn=50);
      cube([10, span, 10]);
    }
    // cutt bottom part
    translate([-10, -5, -15])
      cube([30, span+10, 15]);
    // drill
    translate([5, span/2, -5])
      cylinder(d=3.5, h=20, $fn=50);
  }
}

for(i=[0:N-1])
  for(j=[0:M-1])
    translate([i*(15+spacing), j*(10+spacing), 0])
      door_stop();
