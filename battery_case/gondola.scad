use <batteriesPack.scad>
include <config.inc>

module gondola()
{
  difference()
  {
    cube([sizeOX, sizeOY+2, sizeOZ/2]);
    batteriesPack([margin, margin, margin]);
  }
}

gondola();
%batteriesPack([margin, margin, margin]);
