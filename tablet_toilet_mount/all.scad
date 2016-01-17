use <support.scad>
use <wallMount.scad>

//support();
//wallMount();

%wallMount();
%translate([150, 0, 14.5])
  rotate([0, 180, 0])
    support();
