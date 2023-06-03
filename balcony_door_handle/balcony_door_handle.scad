$fn=100;

module supportCore()
{
  // top cylinder
  translate([0, 0, 30-5])
    rotate([-90, 0, 0])
      cylinder(r=5, h=40);
  // main support
  translate([-5, 0, 0])
    cube([10, 40, 30-5]);
}


module support()
{
  difference()
  {
    supportCore();
    for(offset = [-5, +5])
      translate([offset, 0, 0])
        scale([1, 1, (30-5)/(2*2)])
          translate([0, -1, 2])
           rotate([-90, 0, 0])
             cylinder(r=2, h=42);
  }
}


module mountingPad()
{
  translate([-30/2, -10, 0])
    cube([30, 60, 2]);
}


mountingPad();
translate([0, 0, 2])
  support();
