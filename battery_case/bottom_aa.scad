use <batteriesPack.scad>
use <gondola.scad>
include <config.inc>

module bottomAA()
{
  gondola();
}

bottomAA();
%batteriesPack([margin, margin, margin]);
