use <rear.scad>


module hotend_mock()
{
  translate([0, 14.4, 0])
    rotate([0, 180, 0])
      translate([0, 66, 0])
        rotate([0, 0, 180])
          translate([13.65, -1.745, -23.09])
            rotate([0, -90, 0])
              translate([-110, -50, 0])
                import("stl/hotend_mosquito_magnum_plus.stl");
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
          import("stl/mosquito_voron_th_front.stl");
  }

  difference()
  {
    base();
    extra_heatsink_space();
  }
}



module assembly(mocks)
{
//  extra_heatsink_space();
  front();
  if(mocks)
  {
    %hotend_mock();
//    rear();
  }
}


intersection()
{
  assembly(mocks=$preview &&1);
//  translate([0, 0, -50])
//  cube([100, 100, 100]);
}
