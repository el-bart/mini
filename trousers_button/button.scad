count=2;
spacing=18;

module externalPart()
{
  cylinder(r=14/2, h=2, $fn=100);
  translate([0,0,2])
    difference()
    {
      cylinder(r=7/2, h=5, $fn=50);
      cylinder(r=5/2, h=5, $fn=50);
    }
}

module internalPart()
{
  cylinder(r=(14+2)/2, h=2, $fn=100);
  translate([0,0,2])
    cylinder(r=(5-1)/2, h=5-0.5, $fn=50);
}


for(i=[0:count-1])
{
  translate([0, i*spacing, 0])
  {
    translate([spacing, 0, 0])
      externalPart();
    internalPart();
  }
}
