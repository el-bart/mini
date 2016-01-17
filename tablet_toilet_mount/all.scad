use <support.scad>
use <wallMount.scad>

module bothElements()
{
  support();
  wallMount();
}


module closedPosition()
{
  wallMount();
  translate([150, 0, 14.5])
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
%openPosition();

//bothElements();
