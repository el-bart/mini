$fn=360;
wall=2;
r_shaft=99.1/2;
h=70;
eps=0.01;

module grab()
{
  $fn=120;
  d=20;
  t=4;
  translate([-t/2, -d/2, 0])
    difference()
    {
      union()
      {
      cube([t, d, d]);
      translate([0, d/2, d])
        rotate([0, 90, 0])
          cylinder(r=d/2, h=t);
      }
      translate([-eps, d/2, d])
        rotate([0, 90, 0])
          cylinder(r=6/2, h=t+2*eps);
    }
}

//grab();
