batteryDiameter = 15;
batteryLength   = 49;
include <wing.scad>


for(m = [0,1])
{
  mirror([m,0,0])
  {
    translate([5,0,0])
      wing();
    %translate([27, -3, 2+1])
      batteryAAA();
  }
}
