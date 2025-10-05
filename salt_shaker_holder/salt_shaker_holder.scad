include <m3d/all.scad>

d_ss_bottom = 42;
d_ss_center = 50.5;
wall = 2;
side_rim_h = 16;
wall_extra_space = 6;
salt_shaker_base_d = d_ss_center + 5 + 2*wall;
siede_rounding = 5;


module salt_shaker_mock()
{
  b_off = 17;

  translate([0, 0, b_off])
  {
    // bowl
    intersection()
    {
      sphere(d=d_ss_center);
      translate([0, 0, -b_off])
        cylinder(d=100, h=b_off+100);
    }
    // top
    cylinder(d=34.5, h=58);
    // bottom
    translate([0, 0, -b_off])
      cylinder(d=d_ss_bottom, h=b_off);
  }
}


module salt_shaker_base_2d()
{
  d = salt_shaker_base_d;
  translate([0, d/2 + wall_extra_space])
    hull()
    {
      circle(d=d, $fn=fn(80));
      translate([-d/2, -d/2 - wall_extra_space])
        square([d, 1]);
    }
}


module salt_shaker_base(mocks=$preview)
{
  cut_in = 2;

  module rim()
  {
    linear_extrude(side_rim_h)
      difference()
      {
        salt_shaker_base_2d();
        offset(-wall)
          salt_shaker_base_2d();
        translate([0, -wall-eps, 0])
          offset(-wall)
          salt_shaker_base_2d();
      }
  }

  module base()
  {
    difference()
    {
      linear_extrude(cut_in + wall)
        salt_shaker_base_2d();
      translate([0, wall_extra_space + salt_shaker_base_d/2, wall])
      {
        cylinder(d=d_ss_bottom + 2*3, h=cut_in+eps, $fn=fn(80));
        %if(mocks)
          translate([0, 0, 0])
          salt_shaker_mock();
      }
    }
  }

  module wall_plate()
  {
    r = siede_rounding;
    t = max(2*r, 2*wall) + eps;
    s = [salt_shaker_base_d + 2*r, t, 80];
    translate([-s.x/2, 0, -r])
      intersection()
      {
        translate([0, -t/2, 0])
          rounded_cube(s, r, $fn=fn(50));
        cube(max(s.x, s.y, s.z)*[1,1,1]);
      }
  }

  translate([0, 0, siede_rounding])
  {
    wall_plate();
    base();
    translate([0, 0, cut_in + wall])
      rim();
  }
}


rotate([90, 0, 0])
  salt_shaker_base();
