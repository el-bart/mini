module sdCardReader()
{
  difference()
  {
    union()
    {
      // main board
      cube([45,31,2]);
      // card connector
      translate([45-29+3.5, (31-29)/2, 2])
        cube([29,29,3]);
      // connectors
      translate([0, (31-20.5)/2, 2])
        cube([5, 20.5, 8]);
      // plugs
      translate([1, (31-20.5)/2, 8+2])
        cube([2, 20.5, 18]);
    }
    for(offset = [
                   [3/2+1, 3/2+1, -1],
                   [3/2+1, 31-3/2-1, -1]
                 ])
    {
      translate(offset)
        cylinder(r=(3+1)/2, h=4, $fs=1);
    }
  }
}

sdCardReader();