include <m3d/math.scad>
use <m3d/fn.scad>

mount_size = 40.1*[1,1,0] + [0, 0, 10];

module toilet_paper_mock()
{
  h = 100;
  difference()
  {
    cylinder(d=125, h=h); // upper bound diameter
    translate([0, 0, -eps])
      cylinder(d=40, h=h+2*eps); // lower bound diameter
  }
}


module mount_mock()
{
  s = mount_size;
  translate(-0.5*[s.x, s.y, 0])
    cube(s);
  translate([0, 0, s.z])
    cylinder(d=4, h=10.3, $fn=fn(15));
}


//toilet_paper_mock();

mount_mock();
