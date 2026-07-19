include <m3d/all.scad>
use <flowerpot_saucer.scad>

engraving_h = 1;
d1 = 100;
d2 = 140;
h = 130;
n = 7;
wall = engraving_h + 2.0;

module dolphin_engrave(dh=eps)
{
  b = 360/n/2; // half the angle of rotation of each wall
  function d2x(d) = d/2 * cos(b);
  x1 = d2x(d1); // center-to-lower-edge
  x2 = d2x(d2); // center-to-upper-edge

  a = atan( (x2-x1) / h ); // wall angle

  module base()
  {
    linear_extrude(engraving_h + dh)
      minkowski()
      {
        scale(0.40*[1,1])
          translate([-50, -90, 0])
          import("detail/happy_dolphin.svg");
        circle(d=0.7);
      }
  }

  translate([x1, 0, 0])
    rotate([0, a, 0])
    translate([-engraving_h, 0, 60])
    rotate([90, 0, 90])
    translate([-17, 0, 0])
    base();
}


module flowerpot()
{
  module body()
  {
    rotate([0, 0, 360/n/2])
      difference()
      {
        cylinder(d1=d1, d2=d2, h=h, $fn=n);
        translate([0, 0, wall])
          cylinder(d1=d1-2*wall, d2=d2-2*wall, h=h, $fn=n);
        // de-watering hole
        translate([0, 0, -eps])
          cylinder(d=3, h=wall+2*eps, $fn=fn(30));
      }
  }

  difference()
  {
    body();
    for(r=[0: 360/n : 360])
      rotate([0, 0, r])
        dolphin_engrave();
  }
}

flowerpot();

%if($preview)
  translate([0, 0, -2-2])
  render()
  saucer();
