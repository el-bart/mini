include <../m3d/math.scad>

$fs=1;
$fa=0.5;

module saucer(d)
{
  // main body
  difference()
  {
    cylinder(h=22, r1=d/2, r2=(d+20)/2);
    translate([0, 0, 2])
    {
      cylinder(h=20, r1=(d-2)/2, r2=(d-2+20)/2);
      // this one just for preview esthetics (removes top semi-transparent part)
      if($preview)
        translate([0, 0, 20-eps])
          cylinder(h=2*eps, r=(d-2+20)/2);
    }
  }
  // inner supports
  difference()
  {
    for(r=[0, 45, 90, 135])
      rotate([0, 0, r])
        translate([-d/2, -2/2, 2])
          cube([d, 2, 2]);
    cylinder(r=40/2, h=5);
  }
}

saucer(d=102);
