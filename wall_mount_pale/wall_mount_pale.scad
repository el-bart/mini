count = 2; // number of pales needed

module element()
{
  for(i = [0:9])
    translate([0, 3*i, 0])
      rotate([-90, 0, 0])
        cylinder(h=5, r1=5/2, r2=0, $fs=0.01);
  translate([0, -2, 0])
    rotate([-90, 0, 0])
      cylinder(h=2, r=20/2, $fn=100);
}

module halfElement()
{
  difference()
  {
    element();
    translate([-20, -3, -12])
      cube([50,50,12]);
  }
}

for(i = [0:count-1])
  translate([i*22, 0, 0])
  {
    translate([0, 5, 0])
      halfElement();
    rotate([0, 0, 180])
      halfElement();
  }
