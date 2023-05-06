use <m3d/fn.scad>
eps = 0.01;

module servo_harness()
{
  difference()
  {
    cube([20, 10, 40]);
    translate([(20-14)/2, 10-7+eps, (40-35)/2])
    {
      cube([14, 7+eps, 35]);
      translate([0, -5, (35-24)/2])
        cube([14, 5+eps, 24]);
      // screw holes
      for(dz=[-1, +1])
        translate([0, 0, dz*27/2])
          translate([14/2, -5, 35/2])
            rotate([-90, 0, 0])
              cylinder(d=2+0.5, h=10, $fn=fn(50));
    }
  }
  cube([20, 30, 2.5]);
}

rotate([90, 0, 0])
  servo_harness();
