use <batteriesPack.scad>
use <gondola.scad>
include <config.inc>

holeR = (screwDiameter+1)/2;

module bottomAA()
{
  gondola();
  // hinge
  difference()
  {
    translate([-7, (sizeOY+2)/2, 0])
      cube([7, 4, sizeOZ/2]);
    // hole
    translate([holeR+1-7, (sizeOY+2)/2+18/2, sizeOZ/2-holeR-1])
      rotate([90,0,0])
        cylinder(r=holeR, h=18, $fs=0.01);
  }
  // catch
  translate([sizeOX, (sizeOY+2)/2-6/2, sizeOZ/2-2-1])
    cube([1, 6, 2]);
}

bottomAA();
%batteriesPack([margin, margin, margin]);
