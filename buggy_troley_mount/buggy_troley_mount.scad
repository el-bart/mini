r_mount=(28.8+2*2.1)/2;
h=20;
eps=0.01;

module mount_rod_space()
{
  translate([0, 0, -eps])
    cylinder(r=r_mount, h=h+2*eps, $fn=180);
}


module body_core()
{
  // holes rod
  rotate([0, 0, 180-30])
    hull()
      for(dx=[0, 90])
        translate([dx, 0, 0])
          cylinder(r=30/2, h=h);
  // rod_slot
  cylinder(r=30/2, h=h);
  translate([-35, -40, 0])
    cube([50, 40, h]);
  // stubbing hole, between two elements
  translate([-35, 0, 0])
    cube([20, 10, h]);
}


module buggy_troley_mount()
{
  difference()
  {
    body_core();
    translate([-20/2, -20, 0])
      mount_rod_space();
  }
}


buggy_troley_mount();
