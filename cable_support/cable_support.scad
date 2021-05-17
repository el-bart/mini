eps=0.01;
wall=4;
h=wall+8+5;
$fn=60;
N=4;
M=2;

module support_()
{
  translate(-wall/2*[0, 1, 0])
  {
    dist=8+wall+(8+2)/2;
    cube([dist, wall, wall]);
    translate([dist-wall, 0, 0])
      cube([wall, wall, wall+8]);
  }
}

module screw_space_()
{
  cylinder(r=(3.5+0.4)/2, h=h+eps);
  translate(-eps*[0,0,1])
    cylinder(r1=(8+0.5)/2, r2=(3.5+0.5)/2, h=4.5+eps);
}


module element()
{
  difference()
  {
    union()
    {
      cylinder(r=(8+2)/2, h=h);
      support_();
    }
    screw_space_();
  }
}


for(i=[1:N])
  for(j=[1:M])
    translate([(j-1)*25, (i-1)*12, 0])
      element();
