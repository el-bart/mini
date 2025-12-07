include <m3d/all.scad>

LED_mock_size = [13, 7.5, 3];
wall = 0.6; // if it's hard to print, go for 0.8
mod_h = 2*wall + LED_mock_size.z;

base_d_int = 17;
base_d_ext = base_d_int + 2*wall;
cover_h = 3;

module LED_mock()
{
  s = LED_mock_size;
  translate([-s.x/2, -s.y/2, 0])
  {
    cube(s);
    // cable
    cube([s.x+20, 3, 1]);
  }
}


module lamp(mocks=$preview)
{
  module bottom()
  {
    $fn=fn(50);
    square_side = base_d_int / sqrt(2);

    difference()
    {
      cylinder(d=base_d_ext, h=mod_h);
      // inner space
      translate([0, 0, wall])
        cylinder(d=base_d_int, h=mod_h - 2*wall);
      // slot for inserting LED
      translate([0, -LED_mock_size.y/2, wall])
        cube([base_d_ext, LED_mock_size.y, LED_mock_size.z]);
      // top cut for light to pass through
      translate(-square_side/2*[1,1,0] + [0, 0, mod_h - wall - eps])
        cube(square_side*[1,1,0] + [0, 0, wall+2*eps]);
    }
  }

  module top()
  {
    $fn=fn(40);

    difference()
    {
      cylinder(d1=base_d_ext, d2=base_d_ext*2/3, h=cover_h);
      cylinder(d1=base_d_int, d2=base_d_int*2/3, h=cover_h-wall);
    }
  }

  bottom();
  translate([0, 0, mod_h])
    top();

  %if(mocks)
    translate([0, 0, wall])
    LED_mock();
}


lamp();
