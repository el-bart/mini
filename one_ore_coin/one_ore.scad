include <m3d/all.scad>

coin_d = 20;
coin_h = 2;
engrave_h = 0.6;

module base_unscaled()
{
  d = 140;
  $fn=fn(50);
  cylinder(d=d, h=coin_h/2);

  translate([0, 0, coin_h/2])
    difference()
    {
      cylinder(d=d,    h=engrave_h);
      cylinder(d=d-10, h=engrave_h+eps);
    }
}

module heads()
{
  module model()
  {
    base_unscaled();

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

  resize(coin_d*[1,1])
    model();
}

module tails()
{
  module model()
  {
    base_unscaled();

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

  resize(coin_d*[1,1])
    model();
}

heads();

translate([coin_d+3, 0, 0])
  tails();
