use <m3d/fn.scad>
wall=1.5;
eps = 0.01;

module box_top()
{
  size = [50, 60, wall];
  difference()
  {
    union()
    {
      cube(size);
      translate(3/2*wall*[1,1,0])
        cube(size-wall*[3,3,0] + [0,0,wall]);
    }
    translate([12, size[1]/2, -eps])
     cylinder(d=7.5, h=10*wall, $fn=fn(60));
  }
}

box_top();
