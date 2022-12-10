use <m3d/fn.scad>
eps = 0.01;

module hook(d_shaft, l)
{
  difference()
  {
    union()
    {
      cylinder(d=2*d_shaft, h=l, $fn=fn(30));
      translate([-4*d_shaft/2, 0, d_shaft/2/2])
        rotate([0, 90, 0])
          cylinder(d=d_shaft/2, h=4*d_shaft, $fn=fn(30));
    }
    translate([0, 0, -eps])
      cylinder(d=d_shaft, h=l+2*eps, $fn=fn(50));
  }
}

module sized_hook()
{
  hook(d_shaft=3.5, l=5);
}

sized_hook();
