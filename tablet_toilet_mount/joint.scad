module joint(groundSpacing)
{
  hch = groundSpacing + 6.5/2;  // hole center height

  difference()
  {
    // main element
    union()
    {
      cube([3, 6.5, hch]);
      translate([0, 6.5/2, hch])
        rotate([0, 90, 0])
          cylinder(r=6.5/2, h=3, $fs=0.01);
    }
    // screw hole
    translate([-1, 6.5/2, hch])
      rotate([0, 90, 0])
        cylinder(r=4.5/2, h=3+2*1, $fs=0.01);
  }
}


joint(1);
