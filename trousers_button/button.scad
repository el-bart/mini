count=2;

module femalePart()
{
  cylinder(r=14/2, h=2, $fn=100);
  translate([0,0,2])
    difference()
    {
      cylinder(r=7/2, h=5, $fn=50);
      cylinder(r=5/2, h=5, $fn=50);
    }
}

module malePart()
{
  cylinder(r=14/2, h=2, $fn=100);
  translate([0,0,2])
    cylinder(r=3/2, h=5-0.5, $fn=50);
}


translate([20,0,0])
  femalePart();
malePart();