include <config.scad>

module grab()
{
  $fn=120;
  d=20;
  t=4;
  translate([-t/2, -d/2, 0])
  {
    cube([t, d, d/2]);
    translate([0, d/2, d/2])
      rotate([0, 90, 0])
      cylinder(r=d/2, h=t);
  }
}

grab();
