eps = 0.01;

module element()
{
  difference()
  {
    union()
    {
      // center guideing element
      intersection()
      {
        cylinder(d=35-0.5, h=42-4, $fn=200);
        translate([-100/2, -3.5/2, 0])
          cube([100, 3.5, 50]);
      }
      // core cylinder
      cylinder(d=32-0.5, h=42-4, $fn=200);
    }
    // center side cut
    translate([0, 50/2, 26/2+7])
      rotate([90, 0, 0])
        cylinder(d=26+0.5, h=50, $fn=200);
    // bottom cut
    translate([0, 0, -eps])
      cylinder(d=17, h=2.5);
    // screw hole
    translate([0, 0, -eps])
      cylinder(d=3.5, h=50, $fn=30);
    // screw head
    translate([0, 0, -eps])
      cylinder(d=9.5, h=42-4-5+2.5, $fn=30);
  }
}

rotate([180, 0, 0])
  element();
