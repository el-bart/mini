$fn=200;

difference()
{
  union()
  {
    cylinder(r=(60-1)/2, h=25);
    cylinder(r=60/2+5, h=1);
  }
  cylinder(r=(60-1)/2-1.6, h=25);
}
