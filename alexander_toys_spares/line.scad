eps = 0.01;

module line(n)
{
  d = 4;
  d2d = 6.0;
  d2e = 3.3;
  w = 10.15;
  h = 1.06;
  l = (n-1)*d2d + n*d + 2*d2e;

  difference()
  {
    hull()
      for(dx=[-1,+1])
        translate([dx*(l-2*w/2)/2, 0, 0])
          cylinder(d=w, h=h, $fn=60);
    // screw holes
    off_x = (n%2==1) ? 0 : d2d/2 + d/2;
    for(i=[0:floor(n/2)])
      for(dx=[-1,+1])
        translate([dx*(off_x + i*(d2d+2*d/2)), 0, -eps])
          cylinder(d=d, h=h+2*eps, $fn=60);
  }
}

line(n=15);
