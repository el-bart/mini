eps=0.01;
h=20;

difference()
{
  cube([10+47, 10+20.6+10+35, h]);
  // profile cut-in
  translate([10, 10, -eps])
    cube([47+eps, 20.6+eps, h+2*eps]);
  // top cut-in
  translate([10, 10+20.6+10, -eps])
    cube([47+eps, 35+eps, h+2*eps]);
  // cable guide screws
  for(dz=[2.5, 10.4])
    translate([-eps, 10+20.6+10+35 - 19/2, dz+1.5])
      rotate([0, 90, 0])
        cylinder(r=3.5/2, h=10+2*eps, $fn=50);
  // tightening screws
  for(dz=[10/2, h-10/2])
    translate([10+47 - 7/2, -eps, dz])
      rotate([-90, 0, 0])
        cylinder(r=3.5/2, h=10+20.8+10+2*eps, $fn=50);
}
