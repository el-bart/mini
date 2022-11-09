$fn = 100;
eps = 0.01;

module tester()
{
  module pair(d, h)
  {
    translate([0, 0, 11-h+eps])
    {
      cylinder(d=d, h=h);
      translate([0, 9, 0])
        cylinder(d=d, h=h+10);
    }
    translate([5+0.6*d, 0, 0])
      children();
  }

  difference()
  {
    cube([35, 20, 11]);
    translate([5, 5, 0])
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
