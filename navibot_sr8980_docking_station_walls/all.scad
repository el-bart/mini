use <leftWall.scad>
use <rightWall.scad>

leftWall();
translate([0, -85, 0])
  rightWall();
