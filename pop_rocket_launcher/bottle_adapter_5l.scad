use <libs/threads.scad>

// 5l bottle thread is 48mm on the outside - 1 full rotation (h=5mm)
// 1.5l bottle is 27mm (not strictly needed but useful for connecting a hose)
ScrewHole(outer_diam=48, height=5)
  cylinder(d=60, h=5);
