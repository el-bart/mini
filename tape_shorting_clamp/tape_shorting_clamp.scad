count=2;

w = 18+2*(4+2*2);

module distancingElement()
{
  difference()
  {
    cube([w, 8+6, 2]);
    for(dx = [2+4/2, w-(2+4/2)])
      translate([dx, 8/2+4/2, -1])
        cylinder(r=4/2, h=4, $fs=0.1);
  }
}

module clamp()
{
  difference()
  {
    cube([w, 4+2*2, 2]);
    for(dx = [2+4/2, w-(2+4/2)])
      translate([dx, 8/2, -1])
        cylinder(r=4/2, h=4, $fs=0.1);
  }
}


for(i = [0:count-1])
  translate([i*35,0,0])
    {
      distancingElement();
      for(dy = [0, 10])
        translate([0, 16+dy, 0])
          clamp();
    }
