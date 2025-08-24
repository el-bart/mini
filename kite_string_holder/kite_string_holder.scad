include <m3d/all.scad>

h1 = 0.36;
h2 = 1.5;
s1 = [40, 19, h1];
s2 = [s1.x, s1.y/2, h2];
cube_r = 2;
hole_d = 2;
holes_kite = 5;
holes_string = 2;


module half()
{
  module core()
  {
    $fn=fn(30);
    side_rounded_cube(s1, cube_r);
    side_rounded_cube(s2, cube_r);
  }

  module holes(dy, n)
  {
    for(ix=[0:n-1])
      translate([s1.x/n/2 + ix*(s1.x/n), dy, -eps])
        cylinder(d=hole_d, h=h2+2*eps, $fn=fn(50));
  }

  difference()
  {
    core();
    holes(s1.y*3/4, holes_string);
    holes(s2.y/2, holes_kite);
  }
}


half();

translate([0, -2, 0])
  mirror([0,1,0])
  half();
