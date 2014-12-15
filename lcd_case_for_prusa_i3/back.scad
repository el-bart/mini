use <front.scad>
include <positions.scad>

module back()
{
  difference()
  {
    union()
    {
      // main mounting legs
      for(offset = [ [0, 0, 0], [boxSize[0]-16, 0, 0], [boxSize[0]-70, 0, 0] ])
        translate(offset)
          cube([16, 40+13, 7]);
      // side mounting wing
      translate([15, 0, 0])
        cube([18, 20, 7]);
      // upper beam, mounting all legs together
      translate([0, 40+13, 0])
        cube([boxSize[0], 5+5, 7]);
      // both upper holdings
      for(offsetOX = [0, 29])
        translate([offsetOX, 40+13+5+5, 0])
          cube([10, boxSize[1]-(40+13+5+5), 7]);
      // bridge between holdings
      translate([10, 40+13+5+5+50, 0])
        cube([29-10, 7, 7]);
      // knob back holding (if screw would not fit in properly)
      translate([10+(29-10-8)/2, 40+13+5+5+50+7, 0])
        cube([8, 20, 7]);
    }

    // SD card cable hole
    translate(sdCardOffset - [6, 0, 7])
      cube([8, 31+2, 7]);
    // reset button hole
    translate(resetButtonOffset - [0, 0, 10])
      cylinder(r=(16+2)/2, h=30, $fs=1);
    // frame-mounting drills
    for(offsetOY = [ 13/2+5/2, 40+13+4])
      for(offsetOX = [15/2, boxSize[0]-70+16/2, boxSize[0]-16/2])
        translate([offsetOX, offsetOY, -1])
          cylinder(r=(5+2)/2, h=6+7+2, $fs=1);
  }
}

// front stub
%translate([0, 0, 7])
  front();

//rotate([180, 0, 0])
  back();
