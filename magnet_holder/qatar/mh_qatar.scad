include <m3d/all.scad>

magnet_h = 5;
magnet_d = 5 + 0.1;
magnet_n = 3;

layer_height = 0.2;
wide = 10;
d_ext = 60;
d_int = d_ext - 2*wide;
r_cent = (d_ext + d_int) / 2 / 2;
h = magnet_h + 2*layer_height;

module holder()
{
  module ring()
  {
    translate([0, 0, -h + magnet_h])
      difference()
      {
        $fn=fn(50);
        cylinder(d=d_ext, h=h);
        translate([0, 0, -eps])
          cylinder(d=d_int, h=h+2*eps);
      }
  }

  module glue_holes()
  {
    module glue_hole()
    {
      cylinder(d1=wide/2, d2=wide/3, h=magnet_h+eps);
    }

    module magnet_slot()
    {
      cylinder(d=magnet_d, h=magnet_h+eps, $fn=fn(60));
    }

    module holes()
    {
      for(r=[0: 360/magnet_n : 360])
        rotate([0, 0, r])
          translate([0, r_cent, 0])
          children();
    }

    difference()
    {
      children();
      rotate([0, 0, 360/magnet_n/2])
        holes()
        glue_hole();
      holes()
        magnet_slot();
    }
  }

  glue_holes()
    ring();
}


holder();
