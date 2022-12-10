use <m3d/fn.scad>
eps = 0.01;

module screw(d_shaft, r_screw, l)
{
  module blade(r_screw, l)
  {
    minkowski()
    {
      hull()
      {
        translate([r_screw-2*l/2, l/2, 0])
          cylinder(d=l, h=0.1, $fn=fn(40));
        translate([0, l/2/3, 0])
          cylinder(d=l/3, h=0.1);
      }
      sphere(d=1, $fn=20);
    }
  }

  module blades(r_screw, l, n)
  {
    for(i=[0:n-1])
      rotate([45, 0, i*360/n])
        blade(r_screw, l);
  }

  difference()
  {
    union()
    {
      blades(r_screw, l, n=5);
      translate([0, 0, -0.5])
        cylinder(d=d_shaft*2, h=l, $fn=fn(30));
    }
    translate([0, 0, -eps-0.5])
      cylinder(d=d_shaft, h=l+2*eps, $fn=fn(60));
  }
}

module sized_screw()
{
  screw(d_shaft=3.5, r_screw=12, l=5);
}

sized_screw();
