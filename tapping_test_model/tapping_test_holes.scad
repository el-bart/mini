include <m3d/all.scad>

undersize = 0.5;

difference()
{
  cube([45, 15, 10]);
  d = [3, 4, 5, 8];
  delta = [0, 8, 18, 30];
  for(i = [0:len(d)-1])
    translate([5+delta[i], 15/2, -1])
      cylinder(d=d[i] - undersize, h=12, $fn=fn(30));
}
