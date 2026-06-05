include <m3d/all.scad>

d = 10;
h_body = 100;
h_cone = 30;
fin_n = 3;
fin_h_ext = 20;
fin_h_int = 35;
fin_span = 5;
fin_w = 1.5;

$fn=fn(50);


module body()
{
  module fin()
  {
    $fn=fn(10);
    translate([0, d/2, 0])
      hull()
      {
        cylinder(d=fin_w, h=fin_h_int);
        translate([0, fin_span, 0])
          cylinder(d=fin_w, h=fin_h_ext);
      }
  }

  cylinder(d=d, h=h_body, $fn=fn(50));
  for(a=[0: 360/fin_n: 360])
    rotate([0, 0, a])
      fin();
}


module cone()
{
}


body();

!
cone();
