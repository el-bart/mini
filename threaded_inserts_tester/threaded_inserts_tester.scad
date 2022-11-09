$fn = 100;
eps = 0.01;

module tester()
{
  module rise_for(h)
  {
    translate([0, 0, 11-h+eps])
      children();
  }
  module up()
  {
    translate([0, 9, 0])
      children();
  }
  module right()
  {
    translate([9, 0, 0])
      children();
  }
  module pair(d, h)
  {
    right()
    {
      rise_for(h)
      {
        cylinder(d=d, h=h);
        up()
          cylinder(d=d, h=h+10);
      }
      children();
    }
  }

  difference()
  {
    cube([37, 20, 11]);
    translate([-3, 5, 0])
    {
      pair(d=6.4, h=10.5)      // M5x9.5
        pair(d=6.4, h=6.8)     // M5x5.8
          pair(d=4.0, h=6.7)   // M3x5.7
            pair(d=4.0, h=4.0) // M3x3.0
        ;
    }
  }
}

tester();
