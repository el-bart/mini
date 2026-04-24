include <m3d/all.scad>

module vase(n, d, h, twist)
{
  r=d/2;
  module star()
  {
    for(i=[0:n-1])
      rotate([0, 0, i*360/n])
        translate([-r/10/2, 0])
        square([r/10, r]);
  }

  module base()
  {
    minkowski()
    {
      star();
      circle(d=d*2/3, $fn=fn(50));
    }
  }

  linear_extrude(h, twist=twist, slices=h*1/0.2)
    base();
}


// NOTE: print in vase mode!
vase(n=5, d=30, h=70, twist=200);
