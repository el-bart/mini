use<detail/house.scad>
include<detail/common.scad>

module roof_chimney(dir)
{
  single_wall();
  rotate([0, 0, -dir*34.2])
    translate([0, 0.4, 0])
      translate([0, -mount_len, 0])
        single_wall();
}

for(i=[0:2])
  translate([i*(wall*4), 0, 0])
    translate([wall/2+24, 187.1, 0])
      roof_chimney(1);

%house();
