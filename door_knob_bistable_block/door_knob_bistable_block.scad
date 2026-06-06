include <m3d/all.scad>

block_wall = 2;
block_root_len = 45;
block_points = [ [0, 0], [10, -30], [55, 0] ];

base_wall = 3;
base_len = 80;

bounce_wall = 3;
bounce_len = 60;
bounce_h = 17;

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

    module triangle(wall, positions)
    {
      module corner_at(pos)
      {
        translate(pos)
          circle(d=wall, $fn=fn(40));
      }

      hull()
      {
        corner_at(positions[0]);
        corner_at(positions[1]);
      }

      hull()
      {
        corner_at(positions[1]);
        corner_at(positions[2]);
      }

      hull()
      {
        corner_at(positions[2]);
        corner_at(positions[0]);
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
          triangle(wall, block_points);
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
          l = max(block_root_len + block_points[2].x, base_len);
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
