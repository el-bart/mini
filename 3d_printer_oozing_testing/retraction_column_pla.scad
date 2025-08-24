include <m3d/all.scad>

$fn=fn(20);
N=4;
d=5;
space_delta=10;

segments=10;
segment_h=4;
segment_delta=1;

module columns()
{
  module column()
  {
    for(s=[0:segments-1])
    {
      translate([0,0, s*(segment_h+segment_delta)])
      {
        cylinder(d=d, h=segment_h);
        if(s < segments-1)
          translate([0,0, segment_h])
          {
            cylinder(d1=d, d2=d-1, h=segment_delta/2);
            translate([0,0, segment_delta/2])
              cylinder(d1=d-1, d2=d, h=segment_delta/2);
          }
      }
    }
  }

  for(ix=[0:N-1])
    translate([(ix + 1.6^ix)*space_delta, 0, 0])
      column();
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
