use <../m3d/fn.scad>
include <../m3d/math.scad>


module hotend_mock()
{
  translate([0, 14.4, 0])
    rotate([0, 180, 0])
      translate([0, 66, 0])
        rotate([0, 0, 180])
          translate([13.65, -1.745, -23.09])
            rotate([0, -90, 0])
              translate([-110, -50, 0])
                import("../stl/hotend_mosquito_magnum_plus.stl");
}


module extra_heatsink_space()
{
  module heatsink_2d()
  {
    hull()
      intersection()
      {
        projection()
          translate([0, 0, 5])
            hotend_mock();
        translate([-20,0,0])
          square([40, 39.5]);
      }
  }

  h = 15 + 0.2;
  translate([0, 0, -h/2])
    linear_extrude(h)
      offset(r=0.1)
        heatsink_2d();
}


module front()
{
  module base()
  {
    translate([0, 61.5, -1.28 - 27.41])
      rotate([90, 0, 0])
        translate([-35.52, 0, 0])
          import("../stl/mosquito_voron_th_front.stl");
  }

  module base_spaced()
  {
    difference()
    {
      base();
      extra_heatsink_space();
    }
  }

  cut_h = 47.29;
  cutoff_dh = 0;
  cutoff_len = 19;
  cutoff_skew = 0.0; // this should be computed, but it's a pain, so it's eyeballed instead

  module cut_block()
  {
    s = [80, cut_h+eps, 30+eps];
    translate([-s.x/2, -eps, -s.z+eps])
      cube(s);
  }

  module cut_top()
  {
    intersection()
    {
      base_spaced();
      cut_block();
    }
  }

  module cut_bottom()
  {
    difference()
    {
      base_spaced();
      cut_block();
    }
  }

  module cut_plane_2d()
  {
    projection(cut=true)
      rotate([0, 0, 90]) // for extrusion all object must have the same OX sign...
        translate([0, 0, -cut_h])
          rotate([90, 0, 0])
            base();
  }

  module corridor()
  {
    module skew()
    {
      s = cutoff_skew;
      m = [ [ 1, 0, s, 0 ],
            [ 0, 1, 0, 0 ],
            [ 0, 0, 1, 0 ],
            [ 0, 0, 0, 1 ] ] ;
      multmatrix(m=m)
        children();
    }
    translate([0, cut_h, 0])
      rotate([-90, 0, 0])
        rotate([0, 0, -90])
          skew()
            linear_extrude(cutoff_len)
              cut_plane_2d();
  }

  corridor();
  cut_top();
  translate([0, cutoff_len, cutoff_dh])
    cut_bottom();
}


module rear()
{
  module base()
  {
    translate([-0.05, 61.5, -11.67])
      rotate([90, 0, 0])
        translate([-24, 0, 0])
          import("../stl/mosquito_voron_th_rear_cw2.stl");
  }

  module air_duct_space()
  {
    translate([15, 40, -19])
      rotate([32, 0, 0])
        cube([25, 50, 10]);
  }

  difference()
  {
    base();
    extra_heatsink_space();
    air_duct_space(); // otherwise side cable mask will collide with raised air ducts
  }
}



module assembly(mocks)
{
  front();
  %if(mocks || 1)
  {
    hotend_mock();
    rear();
  }
}


if(0)
{
  intersection()
  {
    assembly(mocks=$preview);
    if(0)
      translate([0, 0, -50])
        cube([100, 100, 100]);
  }
}

if(0)
{
  hotend_mock();
  %extra_heatsink_space();
}


if(1)
{
  front();
  rear();
  %hotend_mock();
}
