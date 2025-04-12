include <m3d/all.scad>

wall = 1.8;
size_int = [61, 41, 28];
size_ext = size_int + wall*[2,2,2];


module PWM_controller_top()
{
  spacing = 0.25;
  s = [size_int.x, size_int.y, 2] - spacing*[2,2,0];

  module body()
  {
    cube([size_ext.x, size_ext.y, wall]);
    // edge
    translate((wall+spacing)*[1,1,0] + [0,0,wall])
      difference()
      {
        cube(s);
        translate(wall*[1,1,0] - [0,0,eps])
          cube(s - wall*[2,2,0] + eps*[0,0,2]);
      }
  }

  difference()
  {
    body();
    // potentiometer hole
    translate([15, 15, -eps])
      cylinder(d=7, h=wall+2*eps, $fn=fn(50));
  }
}


module PWM_controller_bottom(mocks=false)
{
  difference()
  {
    cube(size_ext - [0,0,wall]);
    translate(wall*[1,1,1])
    {
      // interior
      cube(size_int + [0,0,eps]);
      // power in
      translate([0, 33, 10])
        cube([3*wall, 8, 5.5], center=true);
      // power out
      translate([size_int.x, 35, 15])
        cube([3*wall, 7, 4.5], center=true);
      // USB (serial port)
      translate([0, 16, 13])
        cube([3*wall, 13, 9], center=true);
    }
  }

  %if(mocks)
    translate([0, size_ext.y, size_ext.z + 5])
    rotate([180, 0, 0])
    PWM_controller_top();
}


PWM_controller_bottom(mocks=$preview);

translate([0, -size_ext.y-5, 0])
  PWM_controller_top();
