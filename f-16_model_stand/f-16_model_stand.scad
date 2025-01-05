use <m3d/fn.scad>
use <m3d/rounded_cube.scad>
include <m3d/math.scad>

stand_span_int = 23;
stand_span_ext = 30;

pitch = 15;
roll = 30;


module src(size)
{
  side_rounded_cube(size, corner_r=1.5, $fn=fn(20)); // wings-tail support
}


module model_holder()
{
  side = 5;
  wing_support_size = [7, 45, side];
  wing_tail_support_size = [wing_support_size.x, 7.5, 2*side];
  bottom_boom = [wing_support_size.x, wing_support_size.x, 15];
  join_bridge_size = [stand_span_int + 2*wing_support_size.x, wing_support_size.x, wing_support_size.z];

  module body()
  {
    for(dx=[-wing_support_size.x - stand_span_ext/2, stand_span_ext/2])
      translate([dx, 0, 0])
      {
        // wings-tail support
        translate([0, 0, -wing_tail_support_size.z/2])
          src(wing_tail_support_size);
      }

    for(dx=[-wing_support_size.x - stand_span_int/2, stand_span_int/2])
      translate([dx, 0, 0])
      {
        // bottom wing support
        src(wing_support_size);
        // block support
        src(bottom_boom);
      }

    // joining bridge
    translate([-join_bridge_size.x/2, 0, bottom_boom.z])
      src(join_bridge_size);
  }

  module holder()
  {
    // base boom
    h = 30;
    translate([-wing_support_size.x/2, 0, 0])
      src([wing_support_size.x, wing_support_size.x, h]);
    // main holder
    screw_d = 3;
    screw_spacing = 0.8;
    screw_separate = 5;
    size = (screw_d + 2*screw_spacing + 2*screw_separate)*[1, 1.5, 0] + [0,0,side];
    translate([-size.x/2, 0, h])
      intersection()
      {
        rotate([pitch, roll, 0])
          difference()
          {
            src(size);
            // screw hole
            translate([size.x/2, size.y-(screw_d+screw_spacing)/2-screw_separate, -eps])
              cylinder(d=screw_d+screw_spacing, h=size.z+2*eps, $fn=fn(50));
          }
        translate([0, 0, -2*size.z])
          cube(4*size);
      }
  }

  translate([0, 0, -bottom_boom.z - wing_support_size.z])
    body();
  holder();
}


rotate([90, 0, 0])
  model_holder();
