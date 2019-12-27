$fn=30;

module screw()
{
  translate([0,0,31.2])
    cylinder(r=8/2, h=4);
  cylinder(r=3.5/2, h=31.2);
}

module body()
{
  difference()
  {
    cube([20, 40, 40]);
    rotate([45,0,0])
      translate([-1, 0, 0])
        cube([20+2, 60, 30]);
  }
}

module screw_hole()
{
  translate([0,0,21])
    cylinder(r=(8+1)/2, h=5+10);
  cylinder(r=(3.5+0.5)/2, h=21);
}


module main()
{
  difference()
  {
    body();
    translate([20/2, 30, 0])
      screw_hole();
  }
}


main();
%translate([20/2, 30, -10+0.2])
  screw();
