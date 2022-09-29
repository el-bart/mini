use <detail/kite_roller.scad>

side_block(left=false);

%translate([0,0,51])
  rotate([180, 0, 0])
    side_block(left=true);
