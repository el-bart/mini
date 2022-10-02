module cable_fix()
{
  difference()
  {
    // main block
    cube([15+14, 11.5+1+2*1, 1.5+2]);
    // main cut
    translate([0, 1, 1.5])
      cube([15+14, 11.5+1, 1.5+2]);
    // cut for center elements
    translate([2, (11.5+1+2*1)/2 - 10/2, 0])
      cube([14-4-2, 10, 1.5]);
  }
}


cable_fix();
