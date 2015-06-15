use <holder.scad>

h=180;
d=41+5;
r=50;

rotate([90, 0, 0])
{
  // bottom part - just for visualization
  %rotate([0, 0, 90])
    holder();

  // main rod
  difference()
  {
    translate([-15, -15, 5+2])
      cube([30, 30, h-5-2]);
    translate([0, -60/2, 35])
      rotate([0, 90, 90])
        cylinder(r=(5+2)/2, h=60);
    translate([-60/2, 0, 20])
      rotate([0, 90, 0])
        cylinder(r=(5+2)/2, h=60);
  }

  // pipe holer's top part
  translate([0, 30/2, d/2+h])
    rotate([90, 0, 0])
    {
      difference()
      {
        cylinder(h=30, r=d/2+5);
        cylinder(h=30, r=d/2);
        translate([-30, 0, 0])
          cube([2*30, 30, 30]);
      }
    }
}