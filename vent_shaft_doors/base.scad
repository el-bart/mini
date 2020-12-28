use<detail/oring.scad>
include<detail/common.scad>

difference()
{
  union()
  {
    cylinder(r=r_shaft, h=h);
    cylinder(r=r_shaft+30, h=wall);
  }
  translate([0, 0, -eps])
    cylinder(r=r_shaft-wall, h=h+2*eps);
}

%translate([0, 0, -5/2])
  oring();
