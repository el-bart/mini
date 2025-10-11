include <m3d/all.scad>

wall = 1.5;
size_ext = [230, 320, 30];
cut_2d = [220, 20];

module box()
{
  size_int = size_ext - wall*[2,2,1];

  module body()
  {
    difference()
    {
      rounded_cube(size_ext, wall, $fn=fn(30));
      // gut the interior
      translate(wall*[1,1,1])
        cube(size_int + [0,0,1]);
      // entry slot
      translate([(size_ext.x - cut_2d.x)/2, size_ext.y - 2*wall, size_ext.z - cut_2d.y])
        cube([cut_2d.x, 3*wall, cut_2d.y+eps]);
      // remove top rounding
      translate([0, 0, size_ext.z - wall])
        cube(size_ext);
    }
  }

  module lock_hinge()
  {
    screw_d = 3.1;
    d = screw_d + 2*2*wall;
    h = size_ext.z - wall;
    spacing = 2;

    translate([-d/2 - spacing, 0, 0])
    {
      difference()
      {
        union()
        {
          cylinder(d=d, h=h, $fn=fn(40));
          translate([0, -d/2, 0])
            cube([d/2 + spacing + wall, d, h]);
        }
        // screw hole
        translate([0, 0, wall])
          cylinder(d=screw_d, h=h, $fn=fn(50));
      }
    }
  }

  body();

  translate([0, 0.7*size_ext.y, 0])
    lock_hinge();
}


intersection()
{
box();
//cube([400, 50, 300]);
}
