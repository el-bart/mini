hh = 25;        // hooks height
pl = 259-2*2;   // plane length
sw = 10;        // support width

// main plane (to be glued to the wall)
cube([45, pl, 1.5]);
// support shelf
translate([10, 0, 1.5])
  cube([10, pl, 8]);

// hooks
for(y = [45, pl/2-sw/2, pl-45-sw])
  translate([10, y, 1.5+8])
    cube([10+7, 10, 5]);
