include <m3d/all.scad>

d = 20;
h_body = 120;
h_cone = 30;
fin_n = 3;
fin_h_ext = 20;
fin_h_int = 35;
fin_span = 8;
fin_w = 1.5;

$fn=fn(50);


module body_cylinder(h)
{
  cylinder(d=d, h=h, $fn=fn(50));
}


module body_bottom()
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

  for(a=[0: 360/fin_n: 360])
    rotate([0, 0, a])
      fin();
  body_cylinder(h_body/2);
}


module body_top()
{
  body_cylinder(h_body/2);
}


module cone()
{
  module profile_2d()
  {
    $fn=fn(200);
    h = h_cone;
    x = d/2;
    r = ( h*h + x*x ) / (2*x);
    intersection()
    {
      o = r - d/2;
      translate([+o, 0, 0])
        circle(r=r);
      translate([-o, 0, 0])
        circle(r=r);
      // 1 piece
      square([100,100]);
    }
  }

  rotate_extrude()
    profile_2d();
}


body_bottom();

translate([0, - d - fin_span - fin_w, 0])
  body_top();

translate([0, d + fin_span + fin_w, 0])
  cone();
