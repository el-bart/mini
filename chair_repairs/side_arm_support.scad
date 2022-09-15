eps = 0.01;

module support_core()
{
  rc = 4; // r corrners
  re = 1; // r edges
  h = 5;
  module round_base()
  {
    $fn = 80;
    translate([0, 0, re])
    minkowski()
    {
      hull()
      {
        // main block
        for(dx=[-1, +1])
          for(dy=[0, 1])
            translate([dx*(45.4-2*(rc+re))/2, rc+re+dy*(50.5-22.5-2*(rc+re)), 0])
              cylinder(r=rc, h=h-2*re);
        // upper part
        for(dx=[-1, +1])
          translate([dx*(21-2*(rc+re))/2, (50.5-rc-re), 0])
            cylinder(r=rc, h=h-2*re);
      }
      sphere(r=re, $fn=40);
    }
  }

  module rods_center()
  {
    translate([0, 50.5-26.2, 1+re])
      translate([0, 0, 8/2])
        rotate([-90, 0, 0])
          children();
  }

  difference()
  {
    // rod mount
    union()
    {
      round_base();
      rods_center()
      {
        translate([0, 0, -28+26.2])
          minkowski()
          {
            cylinder(d=8+1+5, h=28-re, $fn=80);
            sphere(r=re, $fn=40);
          }
        // rod mock
        %cylinder(d=8, h=26.2, $fn=40);
      }
    }
    // rod hole
    rods_center()
      cylinder(d=8+1, h=28+2*eps, $fn=80);
    // side screw holes
    {
      d = 7.5 + 1;
      for(dx=[-1, +1])
        translate([dx*(21.5+7.5)/2, d/2+4.4, -eps])
          cylinder(d=d, h=h+2*eps, $fn=100);
    }
  }
}

module support()
{
  intersection()
  {
    support_core();
    c = 80;
    translate(-c/2*[1, 0, 0])
      cube(c*[1,1,1]);
  }
}


support();
