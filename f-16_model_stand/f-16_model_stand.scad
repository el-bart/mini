use <m3d/fn.scad>
use <m3d/rounded_cube.scad>

stand_span = 23;


module src(size)
{
  side_rounded_cube(size, corner_r=1.5, $fn=fn(20)); // wings-tail support
}


module model_holder()
{
  wing_support_size = [7, 45, 5];
  wing_tail_support_size = [wing_support_size.x, 13.5, 5];
  bottom_boom = [wing_support_size.x, wing_support_size.x, 15];
  join_bridge_size = [stand_span + 2*wing_support_size.x, wing_support_size.x, wing_support_size.z];

  for(dx=[-wing_support_size.x - stand_span/2, stand_span/2])
    translate([dx, 0, 0])
    {
      // lower support
      src(wing_support_size);
      // wings-tail support
      translate([0, 0, -5])
        src(wing_tail_support_size);
      // block support
      src(bottom_boom);
    }

  // joining bridge
  translate([-join_bridge_size.x/2, 0, bottom_boom.z])
    src(join_bridge_size);
}


rotate([90, 0, 0])
model_holder();
