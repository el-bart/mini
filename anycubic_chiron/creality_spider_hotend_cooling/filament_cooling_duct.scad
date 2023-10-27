eps = 0.01;

module bender(r, angle, length, dh)
{
  n = floor(length / dh);
  da = angle / n;

  module cut_2d(h)
  {
    projection(cut=true)
      translate([0, 0, -h])
        children();
  }

  for(i = [0:n-1])
  {
    a = i*da;
    h = i*dh;
    echo(i, a, h);
    rotate([0, da, 0])
      rotate([-90, 0, 0])
        rotate_extrude(angle=a)
          translate([-r, 0, 0])
            cut_2d(h)
              children();
  }
}


module object(h)
{
  difference()
  {
    cylinder(d1=20, d2=5, h=h);
    translate([-3/2, -3/2, -eps])
      cube([3,3,h+2*eps]);
  }
}


//h = 30;
//bender(r=40, angle=90, length=h, dh=0.2)
//  object(h=h);
