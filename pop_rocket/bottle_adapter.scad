eps=0.01;
wall=1;
hose_phi=6;
bottle_screw_phi=27.4 + 0.6;
bottle_screw_h=9;
narrowing_h=10;

module adapter()
{
  // bottom ring
  difference()
  {
    $fn=200;
    cylinder(d=bottle_screw_phi+2*wall, h=bottle_screw_h);
    translate([0,0,-eps])
      cylinder(d=bottle_screw_phi, h=bottle_screw_h+2*eps);
  }
  translate([0, 0, bottle_screw_h])
  {
    // adapter
    difference()
    {
      $fn=100;
      cylinder(d2=hose_phi, d1=bottle_screw_phi+2*wall, h=10);
      translate([0,0,-eps])
        cylinder(d2=hose_phi-2*wall, d1=bottle_screw_phi, h=10+eps);
    }
    // top connector
    translate([0, 0, narrowing_h])
      difference()
      {
        $fn=100;
        cylinder(d=hose_phi, h=10);
        translate([0,0,-eps])
          cylinder(d=hose_phi-2*wall, h=10+2*eps);
      }
  }
}

adapter();
