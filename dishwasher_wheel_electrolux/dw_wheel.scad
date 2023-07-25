use <m3d/fn.scad>

module rod_mock()
{
  d = 5.5;
  $fn = fn(20);
  c = 19-d/2;
  cylinder(d=d, h=c);
  translate([0, 0, c])
  {
    hull()
    {
      sphere(d=d);
      translate([0, -c])
        sphere(d=d);
    }
    hull()
    {
      translate([0, -c, 0])
        sphere(d=d);
      translate([0, -2*c, -c+d/2])
        sphere(d=d);
    }
    hull()
    {
      translate([0, -2*c, -c+d/2])
      {
        sphere(d=d);
        translate([0, -(19-d/2), 0])
          sphere(d=d);
      }
    }
  }
}


module wheel_block()
{
  %rod_mock();

  spacing = 1;
  wall = 3;

  difference()
  {
    cylinder(d=40, h=8, $fn=fn(200));
    // bottom block
    cylinder(d1=12+2*4+spacing, d2=12+spacing, h=4, $fn=fn(100));
    // top cut
    cylinder(d=12+spacing, h=10, $fn=fn(100));
    // space-saver in the center
    translate([0, 0, wall])
      difference()
      {
        cylinder(d=40-2*wall, h=8);
        cylinder(d=12+3*wall, h=8);
      }
  }
  // rollers
  difference()
  {
    h = 22;
    union()
    {
      // center rod
      cylinder(d=12, h=h, $fn=fn(100));
      // bottom roller
      cylinder(d1=12+2*4, d2=12, h=4, $fn=fn(100));
      // top roller
      translate([0, 0, 8])
        cylinder(d2=12+2*4+spacing, d1=12, h=4, $fn=fn(100));
    }
    // center hole
    translate([0, 0, -1])
      cylinder(d=6.5, h=h+2, $fn=fn(100));
    // top cut for rod
    translate([0, -5, 18])
      cube([6.5, 10, 10], center=true);
  }
  // rod blockers
  for(dx = [-1, +1])
    translate([dx*3, -3, 20])
      sphere(r=1, $fn=fn(30));
}

//intersection()
{
wheel_block();
//  translate([-200, -100, -1])
//    cube(200*[1, 1, 1]);
}
