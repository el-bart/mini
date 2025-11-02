include <m3d/all.scad>

lock_wall = 5;
wall = 2;

d_int = 11.8 + 1.5;
d_ext = d_int + 2*lock_wall;

tape_width = 20;
mount_len = 80;

module safe_padlock_mount()
{
  module side_wall()
  {
    module profile()
    {
      hull()
      {
        // left 1/4 circle
        translate([tape_width, 0])
          intersection()
          {
            circle(r=tape_width, $fn=fn(40));
            translate([-tape_width, 0])
              square(tape_width*[1,1]);
          }
        // right 1/4 circle
        translate([mount_len - tape_width, 0])
          intersection()
          {
            circle(r=tape_width, $fn=fn(40));
            square(tape_width*[1,1]);
          }
      }
    }

    linear_extrude(wall)
      profile();
  }


  module base()
  {
    translate([0, d_ext/2, 0])
      cylinder(d=d_ext, h=lock_wall, $fn=fn(60));
    side_wall();
    translate([0, wall, 0])
    rotate([90, 0, 0])
      side_wall();
  }

  difference()
  {
    base();
    translate([0, d_ext/2, -eps])
      cylinder(d=d_int, h=lock_wall+2*eps, $fn=fn(60));
  }
}


mirror([0, 1, 0]) // mirroroing for safe with hinges on the right hand side
  safe_padlock_mount();
