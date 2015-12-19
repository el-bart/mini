use <battery.scad>

surround        = 15;
height          = 150;
wall            = 2;
batteryDiameter = 15;
batteryLength   = 49;

module channel(h)
{
  // side
  cube([2*wall+batteryDiameter, h, wall]);
  // back wall
  cube([wall, h, batteryLength/2]);
  // front holding
  translate([wall+batteryDiameter, 0, 0])
    cube([wall, h, surround]);
}

module wing()
{
  difference()
  {
    // main channel part
    union()
    {
      channel(height);
      rotate([0,0,60])
        translate([0, -2*batteryDiameter, 0])
          channel(2*batteryDiameter);
    }
    // removal of unnecessary elements
    translate([wall, 0, wall])
      cube([batteryDiameter, 2*batteryDiameter, surround]);
    rotate([0,0,60])
      translate([wall, -2*batteryDiameter, wall])
        cube([batteryDiameter, 2*batteryDiameter, surround]);
    // removal of part from which battery will be extracted
    rotate([0,0,60])
      translate([3*wall, -2*batteryDiameter+wall, wall])
        cube([batteryDiameter, batteryDiameter, surround]);
  }
  rotate([0,0,60])
    translate([0, -2*batteryDiameter, 0])
      cube([2*wall+batteryDiameter, wall, surround]);
}


for(m = [0,1])
{
  mirror([m,0,0])
  {
    translate([5,0,0])
      wing();
    %translate([28, -3, wall+1])
      batteryAAA();
  }
}
