d = 3.5;
l = 20;
$fn = 30;

module hook()
{
  // rod
  intersection()
  {
    rotate([5, 0, 0])
      hull()
      {
        sphere(d=d);
        translate([0, 0, 14])
          sphere(d=d);
      }
    translate([0, 0, -d])
      cylinder(d=15, h=30, $fn=5);
  }
  // mount
  difference()
  {
    hull()
    {
      cylinder(d=d, h=d, center=true);
      translate([0, -l, 0])
        cylinder(d=d, h=d, center=true);
    }
    rotate([0, 90, 0])
    translate([0, -l+d/2, 0])
      cylinder(d=2, h=d+2, center=true);
  }
}

rotate([0, 90, 0])
  hook();
