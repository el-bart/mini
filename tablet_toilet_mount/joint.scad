module joint(groundSpacing)
{
  hch = groundSpacing + 8/2;  // hole center height

  difference()
  {
    // main element
    union()
    {
      cube([3, 8, hch]);
      translate([0, 8/2, hch])
        rotate([0, 90, 0])
          cylinder(r=8/2, h=3, $fs=0.01);
    }
    // screw hole
    translate([-1, 8/2, hch])
      rotate([0, 90, 0])
        cylinder(r=4.5/2, h=3+2*1, $fs=0.01);
  }
}


joint(1);
