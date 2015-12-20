use <batteriesPack.scad>
use <gondola.scad>
include <config.inc>

holeR = (screwDiameter+1)/2;

module topAA()
{
  gondola();
  // hinge
  difference()
  {
    translate([sizeOX, (sizeOY+2)/2-4, 0])
    {
      cube([7, 4, sizeOZ/2]);
      translate([1,0,sizeOZ/2])
      {
        cube([2*holeR+2*1, 4, 1+holeR]);
        translate([holeR+1, 4, holeR+1])
          rotate([90,0,0])
            cylinder(r=holeR+1, h=4, $fs=0.01);
      }
    }
    // hole
    translate([sizeOX+holeR+2, (sizeOY+2)/2+18/2, sizeOZ/2+holeR+1])
      rotate([90,0,0])
        cylinder(r=holeR, h=18, $fs=0.01);
  }
  // catch
  translate([-1, (sizeOY+2)/2-(6+2*2)/2, 0])
  {
    difference()
    {
      union()
      {
        cube([1, 6+2*2, sizeOZ-4]);
        translate([-1, 0, sizeOZ/2+3])
          cube([1, 6+2*2, sizeOZ/2-3]);
      }
      translate([-1, 1, sizeOZ/2+0.2])
        cube([1+2*1, 6+2*1, 1+2*0.5]);
    }
  }
}

topAA();
%batteriesPack([margin, margin, margin]);
