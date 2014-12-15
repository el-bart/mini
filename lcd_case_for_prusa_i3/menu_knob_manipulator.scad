module menuKnobManipulator()
{
  difference()
  {
    // part's body
    cylinder(r=30/2, h=10, $fs=1);
    // hole for encoder's sticking-out part ;)
    translate([0,0,10-6])
      cylinder(r=(6+1)/2, h=6, $fs=1);
  }
  // driver part 1
  translate([-(1-0.4)/2, -1/2+2.5, 10-6])
    cube([1-0.2, 1, 6]);
  // driver part 2
  translate([-(1-0.4)/2, -1/2-2.5, 10-6])
    cube([1-0.2, 1, 6]);
}

menuKnobManipulator();