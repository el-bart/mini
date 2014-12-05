difference()
{
  cylinder(h=20, r1=120/2, r2=40/2); // main hull
  cylinder(h=20, r=(22-1)/2);            // center rod
  // bearing holdings
  for(offset = [ [0,0,0], [0,0,20-(7+1)] ])
    translate(offset)
      cylinder(h=7+1, r=(22+1)/2);
}
