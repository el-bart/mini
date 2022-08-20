eps=0.01;

module bed_foot()
{
  h=60;
  d=52;
  difference()
  {
    cylinder(d1=d+10, d2=d, h=h, $fn=200);
    {
      $fn=50;
      // screw drill
      translate(-eps*[0,0,1])
        cylinder(d=4.5, h=h+2*eps);
      // screw guide
      translate(10*[0,0,1])
        cylinder(d1=10, d2=30, h=h);
    }
  }
}


bed_foot();
