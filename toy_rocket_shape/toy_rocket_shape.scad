include <m3d/all.scad>

d = 20;
h_body = 120;
h_cone = 30;
h_booster_eng = 30;
h_booster = 130 - h_booster_eng;
fin_n = 3;
fin_h_ext = 20;
fin_h_int = 35;
fin_span = 8;
fin_w = 1.5;
stage_spacing = 0.3;
engine_throat = 25;

$fn=fn(50);


module body_cylinder(h)
{
  cylinder(d=d, h=h, $fn=fn(50));
}


module fin(r)
{
  $fn=fn(10);
  translate([0, r, 0])
    hull()
    {
      cylinder(d=fin_w, h=fin_h_int);
      translate([0, fin_span, 0])
        cylinder(d=fin_w, h=fin_h_ext);
    }
}


module fins(r)
{
  for(a=[0: 360/fin_n: 360])
    rotate([0, 0, a])
      fin(r);
}


module body_bottom()
{
  fins(d/2);
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


module booster()
{
  dc = d + 2*fin_span;
  delta_fin_h = fin_h_int - fin_h_ext;

  h1 = h_booster - delta_fin_h;
  h2 = -fin_h_int + delta_fin_h;

  module booster_fins()
  {
    rotate([0, 0, 360/fin_n/2])
      mirror([0,0,1])
      fins(r=dc/2);
  }

  module core()
  {
    cylinder(d=dc, h=h_booster - delta_fin_h, $fn=fn(50));
    translate([0,0, h1])
    {
      booster_fins();
      cylinder(d1=dc, d2=d, h=delta_fin_h, $fn=fn(50));
      %if($preview)
        translate([0, 0, h2])
        body_bottom();
    }
  }

  module second_stage_slot()
  {
    translate([0, 0, h1+h2])
      minkowski()
      {
        body_bottom();
        sphere(r=stage_spacing, $fn=fn(10));
      }
  }

  module engine()
  {
    h2 = dc - engine_throat; // 45° angle
    h1 = h_booster_eng - h2;

    cylinder(d1=dc, d2=engine_throat, h=h1);
    translate([0, 0, h1])
      cylinder(d1=engine_throat, d2=dc, h=h2);
  }

  engine();
  translate([0, 0, h_booster_eng])
    difference()
    {
      core();
      second_stage_slot();
    }
}


body_bottom();

translate([0, - d - fin_span - fin_w, 0])
  body_top();

translate([0, d + fin_span + fin_w, 0])
  cone();

translate([d + 2*fin_span, 0, 0])
  booster();
