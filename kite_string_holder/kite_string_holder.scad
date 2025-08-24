include <m3d/all.scad>

dh = 0.36 / 2;
h2 = 2 / 2;
h1 = (h2 - dh);

s1 = [40, 19, h1];
s2 = [s1.x, s1.y/2, h2];
cube_r = 2;

hole_d_kite = 2.5;
holes_kite = 2;

hole_d_string = 2;
holes_string = 5;


module half()
{
  module core()
  {
    $fn=fn(30);
    side_rounded_cube(s1, cube_r);
    side_rounded_cube(s2, cube_r);
  }

  module holes(dy, n, d)
  {
    for(ix=[0:n-1])
      translate([s1.x/n/2 + ix*(s1.x/n), dy, -eps])
        cylinder(d=d, h=h2+2*eps, $fn=fn(50));
  }

  difference()
  {
    core();
    holes(s2.y/2, holes_string, hole_d_string);
    holes(s1.y*3/4, holes_kite, hole_d_kite);
  }
}


half();

translate([0, -2, 0])
  mirror([0,1,0])
  half();
