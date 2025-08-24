$fn=20;
N=4;
d=5;
h=30;
space_delta=10;


module columns()
{
  for(ix=[0:N-1])
    translate([ix*(space_delta*ix), 0, 0])
      cylinder(d=d, h=h);
}

module base()
{
  linear_extrude(2*0.2)
    offset(d)
    hull()
    projection()
    columns();
}

base();
columns();
