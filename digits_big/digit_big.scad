include <m3d/all.scad>

module digit(d, h=3*0.2)
{
  $fn = fn(100);
  f = "Free Sans:style=Bold";
  s = 200;
  linear_extrude(h)
    text(d, font=f, size=s);
}

digit("6");
