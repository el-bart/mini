module resetButton()
{
  cylinder(r=(16+1)/2, h=15);
  // soldering pins:
  translate([0,0,-6])
  {
    translate([-2/2+5,-3/2,0])
      cube([2,3,6]);
    translate([-2/2-5,-3/2,0])
      cube([2,3,6]);
  }
  // mounting cap
  translate([0,0,15-2])
    cylinder(r=22/2, h=2);
  // button's moving part
  translate([0,0,15])
    cylinder(r=16/2-2, h=2);
}

resetButton();