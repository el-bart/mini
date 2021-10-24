wall = 1.5;
low_fi = 7.75;
high_fi = 31.5;
delta_fi = high_fi - low_fi;
w2 = 2*wall;

// lower adapter
difference()
{
  cylinder(d=high_fi, h=35, $fn=200);
  cylinder(d=high_fi-w2, h=35);
}
translate([0,0,35])
{
  // center reduction
  difference()
  {
    cylinder(d1=high_fi, d2=low_fi, h=delta_fi, $fn=200);
    cylinder(d1=high_fi-w2, d2=low_fi-w2, h=delta_fi);
  }
  // top adapter
  translate([0,0,delta_fi])
    difference()
    {
      cylinder(d=low_fi, h=20, $fn=200);
      cylinder(d=low_fi-w2, h=20, $fn=30);
    }
}
