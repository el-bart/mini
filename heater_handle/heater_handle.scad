span=172;
dia=18;
h=60+dia;
$fn=100;

module _handle_main()
{
  difference()
  {
    union()
    {
      // side blocks
      for(dx=[0, span])
        translate(dx*[1,0,0])
          cube([dia, h, dia/2]);
      // top holder
      translate([dia, h, 0])
        cube([span-dia, dia, dia/2]);
      // rounded edges
      for(dx=[0, span-dia])
        translate([dia+dx, h,0])
          cylinder(r=dia, h=dia/2);
    }
    for(dx=[0, span-3*dia])
      translate([2*dia+dx, h-dia, -1])
        cylinder(r=dia, h=dia/2+2);
  }
}

module _hole()
{
  hull()
    for(dx=[-0.5, 0.5])
      translate([dx, 0, -1])
        cylinder(r=(3.8+0.5)/2, h=dia/2+2, $fn=20);
}


module _handle()
{
  difference()
  {
    _handle_main();
    // left cut in
    translate([0, 0, -1])
      rotate(-45*[0, 0, 1])
        cube(dia*[1,2,1]+[0,0,2]);
    // right cut it
    translate([span+dia, 0, dia+1])
      rotate([0, 180, 45])
        cube(dia*[1,2,1]+[0,0,2]);
    // screw holes
    for(dx=[0, span])
      translate([dx+dia/2, dia-2, 0])
        _hole();
  }
}

_handle();
//_hole();
