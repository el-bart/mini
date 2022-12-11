use <m3d/fn.scad>
include <config.scad>

module ogive(r, l)
{
  module ogive2d()
  {
    p = (r*r + l*l) / (2*r);
    intersection()
    {
      translate([-p+r, 0])
        circle(r=p, $fn=fn(2*3.14159*p));
      square([p, p]);
    }
  }
  
  rotate_extrude(angle=360)
    ogive2d();
}


module aft_hull()
{
  rotate([90, 0, 0])
    ogive(r=d/2, l=aft_len);
}


module amid_hull()
{
  rotate([-90, 0, 0])
    cylinder(d=d, h=amid_len);
}


module fwd_hull()
{
  translate([0, amid_len, 0])
    scale([1, fwd_len/d, 1])
      sphere(d=d);
}


module kiosk()
{
  dk1 = d/5;
  dk2 = d/3;
  fwd = 2*(dk1+dk2);
  hull()
    translate([0, (amid_len-fwd)/2, d/2-dk2/2])
    {
      // lower part
      {
        for(dy=[0, fwd])
          translate([0, dy, 0])
            sphere(d=dk2);
      }
      // upper part
      {
        space = dk2-dk1;
        for(dy=[space, fwd-space])
          translate([0, dy, fwd/2])
            sphere(d=dk1);
      }
    }
}


module ctrl_planes()
{
  thickness = d/30;
  span = 1.1*d;
  len_oy_low = d/3;
  len_oy_high = d/5;
  module single_plane()
  {
    hull()
    {
      for(dy=[0, 1])
        for(dz=[-1, +1])
          translate([0, dy*len_oy_high, dz*span/2])
            sphere(d=thickness);
      translate([0, len_oy_low, 0])
          sphere(d=thickness);
    }
  }

  translate([0, -aft_len+len_oy_low, 0])
  for(r=[0, 90])
    rotate([0, r, 0])
      single_plane();
}


module screw()
{
  thickness = d/30;
  span = 0.5*d;
  oy = d/20;
  module single_blade()
  {
    rotate([0, 0, -45])
      hull()
      {
        for(dy=[-1, +1])
          for(dz=[-1, +1])
            translate([0, dy*oy/2, dz*span/2])
              sphere(d=thickness);
      }
  }

  translate([0, -aft_len+d/5, 0])
  {
    n = 4;
    for(i=[0:n-1])
      rotate([0, i*360/(2*n) + 45, 0])
        single_blade();
  }
}


module bathtub_submarine()
{
  screw();
  ctrl_planes();
  aft_hull();
  amid_hull();
  fwd_hull();
  kiosk();
}


bathtub_submarine();
 