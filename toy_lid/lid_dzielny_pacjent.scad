include <funcions.scad>;

int_dia=110;
ext_dia=int_dia+5+2*(3+10);

translate([0, int_dia/2+30, 0])
  con();
lid(internal_diameter=int_dia, external_diameter=ext_dia);
