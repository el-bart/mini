module frying_pan()
{
  $fs=0.5;
  $fa=2;
  wall=3;
  difference()
  {
    union()
    {
      cylinder(r=(121.5+2*wall)/2, h=12);
      translate([0, 0, -20])
        cylinder(r2=(121.5+2*wall)/2, r1=(121.5+2*wall-10)/2, h=20);
      translate([-20/2, -(121.5+2*wall)/2, -20])
        cube([20, 15, 20+12]);
    }
    cylinder(r=121.5/2, h=12+1);
    translate([0, 0, -20+wall])
        cylinder(r2=121.5/2, r1=(121.5-10)/2, h=20-wall);
    // screw holes
    for(dx=[-1, +1])
      translate([dx*5, -96/2, -8])
        rotate([90, 0, 0])
        {
          cylinder(r=3.5/2, h=20);
          cylinder(r=6/2, h=13);
        }
  }
}

frying_pan();
