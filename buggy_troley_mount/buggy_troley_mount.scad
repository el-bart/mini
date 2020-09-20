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
  // main rod with mounts
  rotate([0, 0, 180-30])
  {
    // main block
    hull()
      for(dx=[0, 90])
        translate([dx, 0, 0])
          cylinder(r=30/2, h=h);
    // support rods
    for(dx=[0, 29.5, 60.5])
      translate([90-dx, 0, h])
        cylinder(r=10.5/2, h=30, $fn=50);
  }
  // rod_slot
  difference()
  {
    // main block
    union()
    {
      cylinder(r=30/2, h=h);
      translate([-35, -50, 0])
        cube([50, 50, h]);
      // stubbing hole, between two elements
      translate([-35, 0, 0])
        cube([20, 10, h]);
    }
    // screw hole
    translate([-35-eps, -42, h/2])
      rotate([0, 90, 0])
        cylinder(r=3.5/2, h=50+2*eps, $fn=50);
    // place for bottom block
    translate([-20/2-r_mount, -20-40, -eps])
      cube([r_mount*2, 40, h+2*eps]);
  }
}


module buggy_troley_closure()
{
  dy=30;
  difference()
  {
    cube([r_mount*2, dy, h]);
    translate([r_mount, dy, 0])
      mount_rod_space();
    translate([-eps-10, 8, h/2])
      rotate([0, 90, 0])
        cylinder(r=3.5/2, h=55+2*eps, $fn=50);
  }
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
%translate([-20/2-r_mount, -50, 0])
  buggy_troley_closure();

translate([-75, -30, 0])
  buggy_troley_closure();