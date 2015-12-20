use <bottom_aa.scad>
use <top_aa.scad>
use <batteriesPack.scad>
include <config.inc>

// actual elements
bottomAA();
translate([0, sizeOY+5, 0])
  topAA();

// visualization only:
%translate([0, -sizeOY-40, 0])
{
  bottomAA();
  translate([sizeOX, 0, sizeOZ])
    mirror([1,0,0])
      mirror([0,0,1])
        topAA();
  %translate([0, 1, 0])
    batteriesPack();
}
