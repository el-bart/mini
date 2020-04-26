r_ext=(101+2*4)/2;
r_int=r_ext-2;
cut=5.9+0.1+0.2;
total_h=150;
cylinder_h=total_h-r_ext;

$fn=200;

module box()
{
  difference()
  {
    union()
    {
      // mount
      difference()
      {
        cube([68+r_ext, 2*r_ext, cut+2*2]);
        translate([-1, (2*r_ext-101)/2, -1])
          cube([68-0.2+1, 101, 20]);
        translate([0, (2*r_ext-101-2*2)/2, 2])
          cube([68+2, 101+2*2, cut]);
      }
      // box
      translate([68+2+2+r_ext, r_ext, 0])
      {
        cylinder(r=r_ext, h=cylinder_h);
        translate([0,0,cylinder_h])
          sphere(r=r_ext);
      }
    }
    // cut-in the box
    union()
    {
      translate([68+2+2+r_ext, r_ext, 0])
        translate([0,0,-1])
        {
          cylinder(r=r_int, h=cylinder_h+2);
          translate([0,0,cylinder_h])
            sphere(r=r_int);
        }
    }
  }
}

box();
