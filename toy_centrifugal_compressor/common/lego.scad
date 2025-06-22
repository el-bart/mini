include <../m3d/all.scad>
include <config.scad>

spacing = 0.3;
y = 1.80 + 2*spacing;
x = 4.75 + 2*spacing;

module leg_axle_slot(length)
{
  linear_extrude(length)
    for(dr=[0, 90])
      rotate([0, 0, dr])
        square([x, y], center=true);
}


module lego_round_slot(length)
{
  d = sqrt(x*x + y*y);
  cylinder(d=d, h=length, $fn=fn(50));
}


difference()
{
  cylinder(d=10, h=10);
  translate([0, 0, -eps])
    leg_axle_slot(length=10+2*eps);
}

translate([15, 0 ,0])
  difference()
  {
    cylinder(d=10, h=10);
    translate([0, 0, -eps])
      lego_round_slot(length=10+2*eps);
  }

translate([-15, 0 ,0])
  intersection()
  {
    #lego_round_slot(length=10);
    leg_axle_slot(length=10);
  }
