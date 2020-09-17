module brushEndingModel()
{
  difference()
  {
    // main element's shape
    union()
    {
      cylinder(h=8, r=18/2);
      translate([0,0,8])
      {
        cylinder(r=8/2, h=60);
        translate([0,0,60] + [-8/2,-13/2,0])
          cube([17,13,17]);
      }
    }
    // cut-in for the mount
    cylinder(h=7, r=8/2, $fs=0.01);
    translate([0,0,7])
      cylinder(r=3/2, h=14-7, $fs=0.01);
  }
}

brushEndingModel();
