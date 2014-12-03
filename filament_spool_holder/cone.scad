difference()
{
  cylinder(h=40, r1=120/2, r2=40/2); // main hull
  cylinder(h=40, r=16/2);            // center rod holding
  // bearings' holders
  for(offset = [ [0,0,0], [0,0,40-(7+1)] ])
    translate(offset)
      cylinder(h=7+1, r=(22+1)/2);
}