use <../m3d/fn.scad>

module screw_slot(ddh=0)
{
  spacing = 0.3;
  l = 24.3 + ddh + spacing;
  din = 3.5 + spacing;
  dout = 8.5;
  dh = 4;

  rotate([180, 0, 0])
  {
    cylinder(d=din, h=l, $fn=fn(30));
    cylinder(d1=dout, d2=din, h=dh, $fn=fn(35));
  }
}
