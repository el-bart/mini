include <config.scad>

// pactra paint jar
module paint_mock()
{
  cylinder(d=paint_d, h=28);
  cylinder(d=23, h=paint_h);
}

paint_mock();
