include <m3d/all.scad>

screw_d = 3;
screw_spacing = 0.5;
screw_separate = 5;

rounding = 1.5;

pitch = -10;
roll = -26;


module src(size)
{
  side_rounded_cube(size, corner_r=rounding, $fn=fn(20)); // wings-tail support
}


module model_holder()
{
  h = 30;
  side = 5;
  wing_support_size = [7, 45, side];

  module boom()
  {
    translate([-wing_support_size.x/2, 0, 0])
      src([wing_support_size.x, wing_support_size.x, h]);
  }

  module base()
  {
    size = (screw_d + 2*screw_spacing + 2*screw_separate)*[1, 1.5, 0] + [0,0,side];
    translate([-size.x/2, -0.90, h-4.6])
      rotate([pitch, roll, 0])
      difference()
      {
        src(size);
        // screw hole
        translate([size.x/2, size.y-(screw_d+screw_spacing)/2-screw_separate, -eps])
          cylinder(d=screw_d+screw_spacing, h=size.z+2*eps, $fn=fn(50));
      }
  }

  module insert()
  {
    delta = 0.3;
    size = [8.8-delta, 17.2-delta, 9.8];
    translate([-size.x/2, 0, -size.z+rounding])
      rounded_cube(size, corner_r=rounding, $fn=fn(20));
  }

  base();
  boom();
  insert();
}


intersection()
{
  rotate([90, 0, 0])
    model_holder();
  translate([-50, -50, 0])
    cube([100, 100, 100]);
}
