use <support.scad>
use <wallMount.scad>

module bothElements()
{
  translate([0, 55, 0])
    support();
  wallMount();
}


module closedPosition()
{
  wallMount();
  translate([150, 0, 16])
    rotate([0, 180, 0])
      support();
}

module openPosition()
{
  wallMount();
  translate([150, -4, 4])
    rotate([-90, 180, 0])
      support();
}


//%closedPosition();
//%openPosition();

rotate([0, 0, 90])
  bothElements();
