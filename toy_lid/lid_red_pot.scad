include <funcions.scad>;

int_dia=110;
ext_dia=129;

translate([0, ext_dia/2+15, 0])
  con();
lid(internal_diameter=int_dia, external_diameter=ext_dia);
