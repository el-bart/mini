include <m3d/all.scad>

block_wall = 2.5;
block_root_len = 35;
block_arm_len = 34;
block_arm_angle= 45;

base_len = block_root_len + cos(block_arm_angle)*block_arm_len;

bounce_wall = 2;
bounce_h = 15;

profile_h = 20;


module block_assembly()
{
  module profile_2d()
  {
    module front_rounded_square(size)
    {
      r = size.y/2;
      translate([0, -r, 0])
      {
        square(size - [r, 0]);
        translate([size.x - r, r])
          circle(r=r, $fn=fn(30));
      }
    }

    module block()
    {
      wall = block_wall;
      r = wall/2;
      c = block_arm_len - r;
      translate([0, -r])
      {
        front_rounded_square([block_root_len + 2*c*cos(block_arm_angle), wall]);
        translate([block_root_len - wall/2, 0])
        {
          rotate([0, 0, -block_arm_angle])
            front_rounded_square([block_arm_len, wall]);
          translate(c * [cos(block_arm_angle), -sin(block_arm_angle)])
            rotate([0, 0, block_arm_angle])
            front_rounded_square([block_arm_len, wall]);
        }
      }
    }

    module base()
    {
      s = [1.5, base_len];
      translate([0, -s.y])
        square(s);
    }

    module bounce()
    {
      module shape()
      {
        $fn=fn(60);
        translate([0, -base_len/2])
          difference()
          {
            circle(d=base_len);
            circle(d=base_len - 0.1);
          }
      }

      module reshaped()
      {
        minkowski()
        {
          resize([2*bounce_h, base_len])
            shape();
          circle(d=bounce_wall, $fn=fn(10));
        }
      }

      intersection()
      {
        reshaped();
        // just take the inner part
        {
          l = max(block_root_len + 2*block_arm_len, base_len);
          translate([0, -l])
            square([l, l]);
        }
      }
    }

    base();
    block();
    bounce();
  }

  linear_extrude(profile_h)
    profile_2d();
}


block_assembly();
