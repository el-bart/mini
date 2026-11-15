include <../m3d/all.scad>

module drag_chain_connector_holes(dl=0)
{
  module connector()
  {
    module insert()
    {
      ti_cnck_m3_standard(dl=dl+eps);
    }

    translate([0, -3.75, eps])
    {
      for(dx=[-1,+1])
        translate([dx*7/2, 0, 0])
          insert();
      translate([0, -8, 0])
        insert();
    }
  }

  difference()
  {
    children();
    connector();
  }
}


drag_chain_connector_holes()
  translate([-10, -20, -20])
  cube([20, 20, 20]);
