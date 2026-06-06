include <m3d/all.scad>

bounce_wall = 3;
bounce_len = 60;
bounce_h = 17;

block_wall = 2.3;
block_root_len = 60;
block_d = bounce_len/2;

base_wall = 3;
base_len = 80;

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

    module hook()
    {
      module shape()
      {
        scale([1, 1.4])
          translate([0, -block_d/2])
          intersection()
          {
            difference()
            {
              $fn=fn(50);
              circle(d=block_d);
              circle(d=block_d - 0.1);
            }
            translate([0, -block_d/2])
              square(block_d*[1,1]);
          }
      }

      minkowski()
      {
        shape();
        circle(d=block_wall, $fn=fn(10));
      }
    }

    module block()
    {
      wall = block_wall;
      r = wall/2;
      translate([0, -r])
      {
        front_rounded_square([block_root_len, wall]);
        translate([block_root_len - wall/2, 0])
          hook();
      }
    }

    module base()
    {
      s = [base_wall, base_len];
      translate([0, -s.y])
        square(s);
    }

    module bounce()
    {
      module shape()
      {
        $fn=fn(60);
        translate([0, -bounce_len/2])
          difference()
          {
            circle(d=bounce_len);
            circle(d=bounce_len - 0.1);
          }
      }

      module reshaped()
      {
        minkowski()
        {
          resize([2*bounce_h, bounce_len])
            shape();
          circle(d=bounce_wall, $fn=fn(10));
        }
      }

      intersection()
      {
        translate([0, -5, 0])
          reshaped();
        // just take the inner part
        {
          l = max(block_root_len + block_d, base_len);
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
