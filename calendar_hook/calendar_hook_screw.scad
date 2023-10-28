// bottom
difference()
{
  h = 2;
  hull()
  {
    cylinder(d=20, h=h, $fn=100);
    translate([0, -20, 0])
      cylinder(d=10, h=h, $fn=100);
  }
  // hole
  translate([0, -20, -1])
    cylinder(d=3, h=h+2, $fn=100);
}

// hook
intersection()
{
  rotate([5, 0, 0])
    cylinder(d=3.5, h=14, $fn=50);
  cylinder(d=15, h=30, $fn=5);
}
