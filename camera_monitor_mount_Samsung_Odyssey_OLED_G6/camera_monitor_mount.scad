include <m3d/all.scad>

module cam_mount(rot_angle)
{
  wall = 2;

  module int_profile_2d()
  {
    r = 2.5;
    xy = 53;
    dxy = xy - 2*r;
    hull()
      for(dx=[-1,+1])
        for(dy=[-1,+1])
          translate([dx*dxy/2, dy*dxy/2])
            circle(r=r, $fn=fn(40));
  }

  module ext_profile_2d()
  {
    offset(r=wall)
      int_profile_2d();
  }

  module body()
  {
    l_base = 60;
    l_top = 20;

    difference()
    {
      linear_extrude(l_base + l_top)
        ext_profile_2d();
      translate([0, 0, -eps])
        linear_extrude(l_base + eps)
        int_profile_2d();
      // top threaded insert
      translate([0, 0, l_base + l_top + eps])
        ti_cnck_m3_standard(10);
    }
  }

  body();
}

cam_mount();
