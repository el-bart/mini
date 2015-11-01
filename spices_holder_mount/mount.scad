hh = 25;        // hooks height
pl = 259-2*2;   // plane length
sw = 10;        // support width

// main plane (to be glued to the wall)
cube([pl, 45, 1.5]);
// support shelf
translate([0, 10, 1.5])
  cube([pl, 10, 8]);

// hooks
for(x = [45, pl/2-sw/2, pl-45-sw])
  translate([x, 10, 1.5+8])
    cube([10, 10+7, 5]);