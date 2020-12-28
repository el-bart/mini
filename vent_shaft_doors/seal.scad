use<detail/oring.scad>
include<detail/common.scad>

module seal()
{
  // body
  cylinder(r=r_shaft+15, h=wall);
  // grabs
  for(rot=[0, 90])
    rotate([0, 0, rot])
      for(dx=[-1, 1])
        translate(dx*[r_shaft+5, 0, 0])
          grab();
}

seal();
%translate([0, 0, -5/2])
  oring();
