eps = 0.01;
rod_d = 5+1.2;

module rod_guide()
{
  intersection()
  {
    // main block
    difference()
    {
      cylinder(d=rod_d+1.5, h=20, $fn=30);
      translate([0, 0, -eps])
        cylinder(d=rod_d, h=20+2*eps, $fn=100);
    }
    // cut at the top, to minimize drag
    translate([-50/2, -50/2, -30+1.2])
      rotate([45, 0, 0])
    cube([50, 50, 50]);
  }
}


for(i=[0:1])
  translate([0, i*(rod_d+3), 0])
    rod_guide();
