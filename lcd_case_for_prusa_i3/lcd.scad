module lcdBoard()
{
  difference()
  {
    union()
    {
      // lower plate
      cube([98,60,2]);
      // LCD itself
      translate([0.5, 10, 2])
        cube([97,40,10]);
      // cables
      translate([9, 60-5, -2])
        cube([39,10,2]);
    }
    // drills
    for(offset = [
                   [3/2+1, 3/2+1, -1],
                   [98-3/2-1, 3/2+1, -1],
                   [3/2+1, 60-3/2-1, -1],
                   [98-3/2-1, 60-3/2-1, -1]
                 ])
    {
      translate(offset)
        cylinder(r=(3+1)/2, h=4, $fs=1);
    }
  }
}

lcdBoard();