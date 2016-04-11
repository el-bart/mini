use <joint.scad>

module _supportSurface()
{
  difference()
  {
    // root element
    cube([150, 40, 2]);
    // holes
    for(offset = [30, 90])
      translate([offset, 10, 0])
        cube([30, 20, 2]);
  }
  // lower stripe for wall-support
  off = 4;
  translate([0, -off, 0])
    cube([150, off, 3.5]);
  // upport tablet block-wall
  translate([0, 40-2, 0])
    cube([150, 2, 9]);
}


module support()
{
  _supportSurface();
  for(offset = [10+(3+1), 150-10-3-(3+1)])
    translate([offset, 0, 2])
      joint(2);
}


support();
