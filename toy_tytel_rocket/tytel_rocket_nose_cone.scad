include <m3d/all.scad>

module nose_cone()
{
  $fn=fn(70);
  insert_h = 20;
  top_h = 40;
  d_top = 3;

  // bottom insert
  cylinder(d=29, h=insert_h);
  // top cone
  translate([0, 0, insert_h])
    hull()
    {
      cylinder(d=35, h=eps);
      translate([0, 0, top_h])
        sphere(d=d_top, $fn=fn(30));
    }
}


nose_cone();
