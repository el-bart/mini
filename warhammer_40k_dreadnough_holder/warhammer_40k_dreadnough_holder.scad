$fn=100;

difference()
{
  union()
  {
    hull()
    {
      cube([64+2*3, 19+2*2, 4]);
      translate([(64+2*2)/2, -12, 0])
        cylinder(r=(64+2*3)/2, h=2+2);
    }
    difference()
    {
      cube([64+2*3, 19+2*2, 20+4]);
      translate([-1, 2, 4])
        cube([64+2*4, 19, 20+1]);
    }
  }
  translate([(64+2*2)/2, -12, -1])
    difference()
    {
      cylinder(r=(64+2)/2, h=2+1);
      cylinder(r=(62-2)/2, h=2+1);
    }
}
