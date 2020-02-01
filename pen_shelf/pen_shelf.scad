$fn=30;

module part()
{
  // bottom part
  cube([350, 2*5+70+14.5-10/2, 5]);
  // rounder corners
  hull()
    for(i=[0,1])
      translate([i*(350-10)+10/2, 2*5+70+14.5-10/2, 0])
        cylinder(r=10/2, h=5);
  // mounts
  for(dx=[20, (350-30/2)/2 , 350-20-30/2])
  {
    difference()
    {
      // towers
      union()
      {
        for(dy=[0, 14.5+5])
          translate([dx, dy, 0])
            cube([15, 5, 30]);
      }
      // drill holes
      translate([dx+15/2, -1, 30-15/2])
        rotate([-90, 0, 0])
          cylinder(r=3.5/2, 28);
    }
  }
}

part();
