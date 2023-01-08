eps = 0.01;

module line(n)
{
  d = 4;
  d2e = 3.3;
  w = 10.15;
  h = 1.06;

  // lower side
  l_size = [23.25, w, h];
  difference()
  {
    translate([-l_size[0]/2, -l_size[1]/2, 0])
      cube(l_size);
    translate([0, 0, -eps])
      cylinder(d=d, h=h+2*eps, $fn=60);
  }
  // walls
  for(dx=[-1,+1])
    translate([dx*l_size[0]/2, 0, 0])
      difference()
      {
        hull()
        {
          translate([-h/2, -w/2, 0])
            cube([h, w, h]);
          translate([-h/2, 0, 15-w/2])
            rotate([0, 90, 0])
              cylinder(d=w, h=h, $fn=60);
        }
        // screw hole
        translate([-h/2-eps, 0, 15-3-d/2])
          rotate([0, 90, 0])
            cylinder(d=d, h=h+2*eps, $fn=60);
      }
}

line(n=15);
