use <leftWall.scad>
use <rightWall.scad>

leftWall();
translate([85, 0, 0])
  rightWall();
