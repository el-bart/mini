use <m3d/fn.scad>

eps = 0.01;

module shaver_wall_holder()
{
  size = [45, 60, 3];
  module base()
  {
    wall = 3;
    hull()
    {
      translate(-[size.x/2, size.y/2, 0])
        cube(size);
      s2 = size + 2*wall*[1,1,0];
      translate(-[s2.x/2, s2.y/2, 0])
        cube([s2.x, s2.y, eps]);
    }
  }
  module rod()
  {
    d = 6;
    s = [8, 8, 38];
    difference()
    {
      translate(-1/2*[s.x, s.y, 0])
        cube(s);
      translate([0, s.y/2, size.z+s.z-d/2-15])
        sphere(d=d, $fn=fn(30));
    }
  }

  base();
  for(dx=[-1,+1])
    translate([dx*25/2, 0, size.z])
      rod();
}


shaver_wall_holder();
