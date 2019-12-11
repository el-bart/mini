module mount()
{
  $fs=0.5;
  $fa=2;
  difference()
  {
    translate([-20/2, 0, 0])
      union()
      {
        cube([20, 10, 20+12]);
        translate([0, -90, +20])
          cube([20, 90, 12]);
        translate([20/2, -90, 20])
          cylinder(r=20/2, h=12);
      }
    // screw holes
    for(dx=[-1, +1])
      translate([dx*5, 15, 12])
        rotate([90, 0, 0])
        {
          cylinder(r=3.5/2, h=20);
          translate([0, 0, 12])
            cylinder(r=6/2, h=10);
        }
    // end-hole holding
    translate([0, -90, 20-1])
      cylinder(r=13/2, h=12+2*1);
  }
}

mount();
