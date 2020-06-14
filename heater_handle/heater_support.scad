span=172;
dia=18;
$fn=100;

module _handle()
{
  difference()
  {
    union()
    {
      // side blocks
      for(dx=[0, span])
        translate(dx*[1,0,0])
          cube([dia, 60, dia]);
      // top holder
      translate([dia, 60, 0])
        cube([span-dia, dia, dia]);
      // rounded edges
      for(dx=[0, span-dia])
        translate([dia+dx, 60,0])
          cylinder(r=dia, h=dia);
    }
    for(dx=[0, span-3*dia])
      translate([2*dia+dx, 60-dia, -1])
        cylinder(r=dia, h=dia+2);
  }
}

_handle();
