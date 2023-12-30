use<../m3d/fn.scad>

eps = 0.01;

wall = 1.5;
mount_h = 10;
mount_len = 30;

hole_d = 3.5; // screw
//hole_d = 2.0; // nail

module single_wall()
{
  translate([-wall/2, 0, 0])
    difference()
    {
      cube([wall, mount_len, mount_h]);
      n=3;
      for(i=[1:n])
        translate([0, i/(n+1)*mount_len, 0])
          translate([0, 0, mount_h/2])
            translate([2*wall, 0, 0])
              rotate([0, -90, 0])
                cylinder(d=hole_d, h=3*wall, $fn=fn(30));
    }
}
