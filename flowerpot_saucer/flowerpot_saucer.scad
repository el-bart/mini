$fs=1;
$fa=0.5;

module saucer(d)
{
  difference()
  {
    cylinder(h=22, r1=d/2, r2=(d+20)/2);
    translate([0, 0, 2])
      cylinder(h=20, r1=(d-2)/2, r2=(d-2+20)/2);
  }
  difference()
  {
    for(rz=[0, 45, 90, 135])
      rotate([0, 0, rz])
        translate([-d/2, -2/2, 2])
          cube([d, 2, 2]);
    cylinder(r=(d-2*30)/2, h=5);
  }
}

saucer(d=102);
