length = 144.5;
height = 12;
span   = 40;

module main_block()
{
  cube([length, span, height]);
}

module connector()
{
  translate([-6.5, -6.5/2, 0])
    cube([6.5, 6.5, height]);
  translate([-6.5-11.5/2+1, 0, 0])
    cylinder(r=11.5/2, h=height);
}

module connector_slot()
{
  // TODO
}

module main_track()
{
  difference()
  {
    union()
    {
      main_block();
      translate([0, 40/2, 0])
        connector();
    }
    #connector_slot();
  }
}

main_track();
