include <m3d/all.scad>

size_low  = [140, 100, 1];
size_high = [230, 30,  size_low.z];

plate_angle = 4;

font_type = "Liberation Sans:style=Bold";
font_size = 7;

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

    module ruler()
    {
      cube([50, 5, 1]);
    }

    module centered_text(txt, h)
    {
      // TODO: this can be enabled when never OpenSCAD is released
      //tm = textmetrics(txt, size=font_size, font=font_type);
      //s = tm.size;
      s = font_size*[1,1];
      translate(-0.45*s)
        linear_extrude(h)
        text(txt, size=font_size, font=font_type);
    }

    module round_button(txt)
    {
      h = 2;
      d = 10;
      difference()
      {
        cylinder(d=d, h);
        centered_text(txt, h+eps);
      }
    }

    module square_button(txt)
    {
      h = 2;
      d = 10;
      r = 2;
      difference()
      {
        s = [d,d,h];
        side_rounded_cube(s, r, $fn=fn(30));
        translate(1/2*[s.x, s.y, 0])
          centered_text(txt, h+eps);
      }
    }

    module numpad()
    {
      ox = 15;
      oy = ox;

      txt = "123456789*0#";
      translate([0, 3*oy, 0])
        for(i=[0:12-1])
          translate([ox*(i%3), -oy*floor(i/3), 0])
            square_button(txt[i]);
    }

    module phone_holder()
    {
      s = [55, 120, 15];
      wall = 1.5;
      difference()
      {
        cube(s);
        translate(wall*[1,1,0] - [0,0,eps])
          cube(s - wall*[2,1,0] + eps*[0,1,2]);
      }
    }

    base_plate();
    translate([0, 0, 1])
    {
      translate([-40, 120, 0])
        cipher_wheels();
      translate([-39, 102, 0])
        slider();
      translate([20, 117.5, 0])
        ruler();
      for(dx=[0, 50])
        translate([20+dx, 107.5, 0])
          round_button("1");
      translate([80, 10, 0])
        phone_holder();
      translate([10, 30, 0])
        numpad();
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
    top_plate();
}


panel();
