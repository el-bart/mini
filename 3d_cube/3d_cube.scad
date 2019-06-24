d=2;

difference()
{
  cube([20, 20, 20]);
  translate([d/2,d,d/2])
    rotate([90,0,0])
      linear_extrude(height=d)
        text("X", size=20-d);
  rotate([0,0,90])
    translate([d/2,0,d/2])
      rotate([90,0,0])
        linear_extrude(height=d)
          text("Y", size=20-d);
  translate([d,d,20-d])
    linear_extrude(height=d)
      text("Z", size=20-d);
}
