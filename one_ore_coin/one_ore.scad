include <m3d/all.scad>

coin_h = 2;
engrave_h = 0.6;

module base()
{
  cylinder(d=140, h=coin_h/2, $fn=50);
}

module heads()
{
  base();

  translate([0, 0, coin_h/2])
    linear_extrude(engrave_h)
    rotate([0, 0, -1.3])
    intersection()
    {
      translate([-72, -70])
        import("heads.svg");
      circle(d=121, $fn=50);
    }
}

module tails()
{
  base();

  translate([0, 0, coin_h/2])
    linear_extrude(engrave_h)
    rotate([0, 0, -1.3])
    intersection()
    {
      translate([-72, -70])
        import("tails.svg");
      circle(d=121, $fn=50);
    }
}

!
heads();
tails();
