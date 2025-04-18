use <TLA_pin_and_hole.scad>
include <m3d/all.scad>
include <detail/config.scad>

side = base_len + base_hole_extra_len/2;
d = max(base_d_hole, base_d_pin);
size = [side + 2*base_side_wall, 2*d + 3*base_side_wall, side + 2*base_side_wall];


module TLA_conn_angle(mocks=false)
{
  difference()
  {
    translate([-size.x/2, -size.y/2, 0])
      rounded_cube(size, 2, $fn=fn(30));

    // top part
    translate([0, -size.y/2 + d/2 + base_side_wall, -eps])
      TLA_base_hole_centers()
      cylinder(d=base_d_pin + base_d_spacing, h=side + eps, $fn=fn(60));
    %if(mocks)
      translate([side + size.x/2 + 2, 9, size.z/2])
      rotate([0, -90, 0])
      TLA_pin();

    // bottom part
    translate([size.x/2 - side + eps, size.y/2 - d/2 - base_side_wall, size.z/2])
      rotate([0, 90, 0])
      TLA_base_hole_centers()
      cylinder(d=base_d_hole + base_d_spacing, h=side + eps, $fn=fn(60));
    %if(mocks)
      translate([0, 1.5, -side -2])
      TLA_hole();

  }
}

translate([0, 0, size.z])
rotate([180, 0, 0])
  TLA_conn_angle(mocks=$preview);
