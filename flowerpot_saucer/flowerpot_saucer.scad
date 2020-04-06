$fs=5;
$fa=0.5;

module saucer()
{
  difference()
  {
    cylinder(h=22, r1=102/2, r2=122/2);
    translate([0, 0, 2])
      cylinder(h=20, r1=100/2, r2=120/2);
  }
  difference()
  {
    for(rz=[0, 45, 90, 135])
      rotate([0, 0, rz])
        translate([-102/2, -2/2, 2])
          cube([102, 2, 2]);
    cylinder(r=(102-2*30)/2, h=5);
  }
}

saucer();
