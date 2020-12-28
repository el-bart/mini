use<detail/oring.scad>
use<seal.scad>
include<detail/common.scad>

module bars_()
{
  l=2*r_shaft;
  for(i=[0:3])
    for(dir=[-1,+1])
      translate([i*dir*13, 0, 0])
        translate([-wall/2, -l/2, 0])
          cube([wall, l, wall]);
}


module lattice_()
{
  for(rot=[0, 90])
    rotate([0, 0, rot])
      bars_();
}


module vent()
{
  lattice_();

  difference()
  {
    cylinder(r=r_shaft+15, h=wall);
    translate([0, 0, -eps])
      cylinder(r=r_shaft-wall, h=h+2*eps);
  }
  
  for(rot=[0, 90])
    rotate([0, 0, rot])
      for(dx=[-1, 1])
        translate(dx*[r_shaft+5, 0, 0])
          grab();
}

vent();
%translate([0, 0, -5/2])
  oring();
