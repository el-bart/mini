use <joint.scad>

module _wallSurface()
{
  difference()
  {
    union()
    {
      // root element
      cube([150, 40, 2]);
      // lock mount
      translate([(150-20)/2, 40, 0])
        cube([20, 7, 2]);
    }
    // holes
    for(offset = [30, 90])
      translate([offset, 10, 0])
        cube([30, 20, 2]);
  }
}


module wallMount()
{
  _wallSurface();
  for(offset = [10, 150-10-3])
    translate([offset, 0, 2])
      joint(2);
}


wallMount();
