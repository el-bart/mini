cylinder(d=20, h=0.5, $fn=100);
intersection()
{
  rotate([5, 0, 0])
    cylinder(d=3.5, h=14, $fn=50);
  cylinder(d=15, h=30, $fn=5);
}
