include <m3d/all.scad>

module balancer()
{
  hull()
    for(dy=[0,17])
      translate([0, dy, 0])
        cylinder(d1=16, d2=13, h=0.8, $fn=fn(60));
}

balancer();
