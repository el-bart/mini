$fn=30;

module screw()
{
  translate([0, 0, 20.5])
    cylinder(r=8/2, h=4);
  cylinder(r=3.5/2, h=24.5);
}

module body()
{
  difference()
  {
    cube([15, 25, 25]);
    rotate([45,0,0])
      translate([-1, 0, 0])
        cube([15+2, 40, 30]);
  }
}

module screw_hole()
{
  translate([0,0,20.5-10])
    cylinder(r=(8+1)/2, h=5+10);
  cylinder(r=(3.5+0.5)/2, h=20.5-10);
}


module main()
{
  difference()
  {
    body();
    translate([15/2, 17, 0])
      screw_hole();
  }
}


main();
%translate([15/2, 17, -10+0.5])
  screw();
