eps=0.01;


module roller_main()
{
  difference()
  {
    // core part
    union()
    {
      cylinder(d=20, h=1, $fn=12);
      translate([0, 0, 1])
      {
        // internal roller part
        difference()
        {
          cylinder(d=8, h=10/2, $fn=50);
          translate([0, -10, 10/2-1])
            cube([10, 20, 10]);
          // cut in for string
          translate([2, 0, 2])
            rotate([0, 90, 0])
              cylinder(d=2, h=2, $fn=10);
        }
      }
    }
    // main shaft
    translate([0,0,-1])
      cylinder(d=2.5, h=20, $fn=60);
  }
}


module holder()
{
  wall=2;
  width=12+2*1+2*wall;
  // main bulwark mount
  difference()
  {
    cube([2+2*wall, width, 8+wall]);
    translate([wall, -eps, wall])
      cube([2, width+2*eps, 8+wall]);
  }
  // roller mount
  translate([2+2*wall, 0, 0])
  {
    difference()
    {
      // core
      hull()
      {
        cube([eps, width, 8+wall]);
        translate([13, 0, 8/2])
          rotate([-90, 0, 0])
            cylinder(d=8, h=width, $fn=60);
      }
      // cut-in
      translate([0, wall, -eps])
        cube([20, width-2*wall, 15]);
      // shaft
      translate([13, -eps, 8/2])
        rotate([-90, 0, 0])
          cylinder(d=2.5, h=width+2*eps, $fn=60);
    }
  }
}


for(i=[0,1])
  translate([-12, i*22, 0])
    roller_main();

holder();

%if(true)
  translate([19, 2+3/2, 8/2])
    rotate([-90, 0, 0])
      union()
      {
        roller_main();
        rotate([0, 0, 180])
          translate([0, 0, 11])
            rotate([180, 0, 0])
              roller_main();
      }
