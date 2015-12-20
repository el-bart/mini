use <bottom_aa.scad>
use <top_aa.scad>
use <batteriesPack.scad>
include <config.inc>

// actual elements
//bottomAA();
//translate()
//  topAA();

// visualization only:
bottomAA();
translate([sizeOX, 0, sizeOZ])
  mirror([1,0,0])
    mirror([0,0,1])
      topAA();
%batteriesPack();
