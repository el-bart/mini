use <joint.scad>

module _supportSurface()
{
  difference()
  {
    union()
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
      off = 6.5/2+2+2;
      translate([0, -off, 0])
        cube([150, off, 3]);
      // upport tablet block-wall
      translate([0, 40, 0])
        cube([150, 2, 9]);
    }
    // lock cut-in
    translate([(150-10)/2, 40-(10-2), 0])
      rotate([-90, 0, 0])
        cylinder(h=10, r=7.5, $fs=0.01);
  }
}


module support()
{
  _supportSurface();
  for(offset = [10+(3+1), 150-10-3-(3+1)])
    translate([offset, 0, 2])
      joint(2);
}


support();
