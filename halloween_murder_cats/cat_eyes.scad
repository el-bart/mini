module eye()
{
  cylinder(d=17, h=3*0.2, $fn=80);
  translate([0, 0, 3*0.2])
    cylinder(d=14, h=2*0.2, $fn=40);
}

eye();
