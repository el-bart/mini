include <m3d/all.scad>

engraving_h = 1;
d1 = 100;
d2 = 140;
h = 130;
n = 7;
wall = engraving_h + 1.5;

module dolphin_engrave()
{
  linear_extrude(engraving_h)
    minkowski()
    {
      scale(0.25*[1,1])
        translate([-33, -90, 0])
        import("detail/happy_dolphin.svg");
      circle(d=0.7);
    }
}


module flowerpot()
{
  module body()
  {
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

  body();
#
  dolphin_engrave();
}

flowerpot();
