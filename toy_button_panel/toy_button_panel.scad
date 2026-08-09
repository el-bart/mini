include <m3d/all.scad>

size_low  = [175, 100, 1];
size_high = [260, 30,  size_low.z];

plate_angle = 7;

module panel()
{
  module base_plate()
  {
    cube(size_low);
    translate([-(size_high.x - size_low.x)/2, size_low.y, 0])
      cube(size_high);
  }

  module top_plate()
  {
    module wheel()
    {
      rotate([0, 90, 0])
        cylinder(d=10, h=3, $fn=fn(30));
    }

    module cipher_wheels()
    {
      for(i=[0:9-1])
        translate([i*(3+3), 0, -1])
          wheel();
    }

    module equilateral_triangle(x, h)
    {
      a = 360/3;
      b = 180 - a/2 - 90;
      r = x * cos(b);
      linear_extrude(h)
        polygon([ [        0, r       ],
                  [+r*sin(a), r*cos(a)],
                  [-r*sin(a), r*cos(a)],
        ]);
    }

    module slider()
    {
      s = [50, 10, 1];

      difference()
      {
        cube(s);
        // vertical
        for(dx=[2 : 3 : s.x-2])
          translate([dx, 2, -eps])
            cube([1, s.y-2*2, s.z+2*eps]);
        // horizontal
        translate([2, s.y/2-1/2, -eps])
          cube([s.x-2*2, 1, s.z+2*eps]);
        // indicator
        translate([7, 1.5, -eps])
          equilateral_triangle(2, 1+2*eps);
      }
    }

    base_plate();
    translate([0, 0, 1])
    {
      translate([-40, 120, 0])
        cipher_wheels();
#           
      translate([-40, 120, 0])
        !
        slider();
    }
  }

  // body
  hull()
  {
    base_plate();
    rotate([plate_angle, 0, 0])
      base_plate();
  }
  // top plate at the final angle
  rotate([plate_angle, 0, 0])
//!    
    top_plate();
}


panel();
