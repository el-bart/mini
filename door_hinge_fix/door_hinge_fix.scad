difference()
{
  d=6+1;
  cube([12, 39, 22-16]);
  #for(dy = [5+d/2, 39-6-d/2])
    translate([12/2, dy, -5])
      cylinder(r=d/2, h=20, $fs=0.1);
}
