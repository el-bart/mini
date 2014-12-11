module menuKnob()
{
  // main body
  cube([14,12,6]);
  // pins
  for(offset = [
                 [-2,   2,      -(12-4-4)],
                 [-2,   12-2-2, -(12-4-4)],
                 [12+2, 12-2-2, -(12-4-4)],
               ])
  {
    translate(offset)
      cube([2,2,12-4]);
  }
  // cap holder
  translate([14/2, 12/2, 6])
    cylinder(r=(7+1)/2, h=10, $fs=1);
  // push button distance
  translate([14/2, 12/2, 6+10])
    cylinder(r=(6-2*1)/2, h=1, $fs=1);
  // knob mounting
  difference()
  {
    translate([14/2, 12/2, 6+10+1])
      cylinder(r=6/2, h=6, $fs=1);
    translate([14/2-6/2, 12/2-1/2, 6+10+1+1])
      cube([6,1,5]);
  }
}

menuKnob();