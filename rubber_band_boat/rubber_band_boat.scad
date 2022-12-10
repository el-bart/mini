use <m3d/fn.scad>
eps = 0.01;

module hull_main(l, d, wall)
{
  module hull2d(l, d)
  {
    translate([0, l-d/2, 0])
      scale([1, 2])
        circle(d=d);
    translate([-d/2, 0, 0])
    square([d, l-d/2]);
  }

  module hull_single(l, d, wall)
  {
    $fn=fn(80);
    rotate([90, 0, 180])
      rotate_extrude(angle=180)
        intersection()
        {
          difference()
          {
            hull2d(l, d);
            translate([0, wall, 0])
              hull2d(l-2*wall, d-2*wall);
          }
          square([d, l+d]);
        }
  }

  // catamaran
  for(dx=[-1,+1])
    translate([dx*d, 0, 0])
      hull_single(l, d, wall);

  // connectors
  for(dy=[0,l-d/2])
  {
    bar_len = 3*d - 2*wall;
    translate([-bar_len/2, dy, 0])
      cube([bar_len, 5, 2]);
  }

  module screw_mount(size, dh)
  {
    d_int = 3.5;
    d_ext = d_int + 2.5;
    off = [size[0]/2, size[1], size[2]-dh];
    difference()
    {
      union()
      {
        cube(size);
        translate(off)
          rotate([90, 0, 0])
            cylinder(d=d_ext, h=size[1], $fn=fn(60));
      }
      translate(off + [0, eps, 0])
        rotate([90, 0, 0])
          cylinder(d=d_int, h=size[1]+2*eps, $fn=fn(60));
    }
  }

  module rubber_band_holder(size, dh)
  {
    q = 2*size[0];
    difference()
    {
      cube(size);
      translate([-(q-size[0])/2, q/2, size[2]-dh])
        rotate([-45, 0, 0])
          cube([q,q,q]);
    }
  }

  // screw mounts
  {
    dh = 5;
    size = [3, 5, 1.5*d/2];
    translate([-size[0]/2, 0, 0])
      screw_mount(size, dh);
    translate([-size[0]/2, l-d/2, 0])
      rubber_band_holder(size, dh);
  }
}


hull_main(l=60, d=25, wall=1.5);
