module oring_(d_int, fi)
{
  r_int=d_int/2;
  rotate_extrude($fn=0.2*360)
    translate([r_int+fi/2, 0, 0])
      rotate([0, 0, 180])
        circle(r=fi/2, $fn=20);
}

module oring()
{
  oring_(100, 5);
}

oring();
