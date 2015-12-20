use <batteriesPack.scad>
use <gondola.scad>
include <config.scad>

module bottomAA()
{
  gondola();
}

bottomAA();
%batteriesPack([margin, margin, margin]);
