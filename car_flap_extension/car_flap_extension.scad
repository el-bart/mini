h=2;
count=3;

module extension()
{
  cube([16,10,h]);
  translate([16,5,0])
    cylinder(h=h, r=5, $fs=0.1);
}

for(x=[0:2])
  translate([0, x*13, 0])
    extension();
