use<m3d/fn.scad>
use<template/house.scad>
include<detail/common.scad>

module wall_roof(dir)
{
  single_wall();
  translate([0, mount_len, 0])
    rotate([0, 0, dir*34.2])
      translate([0, -0.4, 0])
        single_wall();
}

translate([-wall*2-0.5, 0, 0])
  for(dir=[-1,+1])
    for(i=[0:2])
      translate([-dir*(i+1)*(wall+2), 0, 0])
        translate([-wall/2, 119.5, 0])
          wall_roof(dir);

%house();
