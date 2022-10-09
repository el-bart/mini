eps = 0.01;
rod_d = 5+0.7;
mount_h = 40;

module rod_mount()
{
  base_h = 4;
  base_d = 35;
  // base
  difference()
  {
    cylinder(d=base_d, h=base_h);
    n=5;
    for(i=[0:n-1])
      rotate([0, 0, 1]*(i/n*360))
        translate([base_d/2-5, 0, -eps])
          cylinder(d=3.5, h=base_h+2*eps, $fn=30);
  }
  // rod holder
  translate([0, 0, base_h])
    difference()
    {
      cylinder(d=rod_d+2.5, h=mount_h, $fn=30);
      cylinder(d=rod_d, h=mount_h+eps, $fn=100);
    }
}


rod_mount();
