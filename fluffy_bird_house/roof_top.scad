use<template/house.scad>
include<detail/common.scad>

module roof_top()
{
  a = 33;
  spacing = 20;
  spacing_marg = spacing + 2*0.5;
  translate([-spacing_marg/2, -wall/2-0.25, 0])
    cube([spacing_marg, wall, mount_h]);
  for(dir=[-1,+1])
    translate([dir*spacing/2, 0, 0])
      rotate([0, 0, dir*a])
        translate([0, -mount_len, 0])
          single_wall();
}

for(i=[0:2])
  translate([0, i*(wall*4), 0])
    translate([wall/2+104.8, 292.85, 0])
      roof_top();

%house();
