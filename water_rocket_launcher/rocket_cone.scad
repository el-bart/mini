module cone()
{
  wall = 3*0.6; // i.e. 3x extrusion width
  difference()
  {
    cylinder(d1=80, d2=0.1, h=50, $fn=100);
    cylinder(d1=80-2*wall, d2=0.1, h=50-wall, $fn=100);
  }
}

cone();
