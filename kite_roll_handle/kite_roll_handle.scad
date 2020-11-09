$fn=120;

module main_handle_()
{
  cylinder(r=18/2, h=120);
  translate([0, 0, 120])
  {
    translate([0, 0, -10])
      cylinder(r1=18/2, r2=30/2, h=10);
    difference()
    {
      cylinder(r=(8.5-0.5)/2, h=22+2+10);
      translate([-5, 0, 22+2+5])
        rotate([0, 90, 0])
          cylinder(r=(3+0.5)/2, h=10);
    }
  }
}

module nut_(h)
{
  block_size=[3.5, 5.5, h];
  n=3;
  hull()
    for(i=[0:n-1])
      rotate(i*[0, 0, 360/n/2])
        translate([block_size[0], block_size[1], 0]*-1/2)
          cube(block_size);
}

module nut_space_()
{
  scale([1.2, 1.2, 1.2])
    nut_(2.5);
}

module block_()
{
  difference()
  {
    union()
    {
      cylinder(r=30/2, h=0.6);
      cylinder(r=15/2, h=10);
    }
    cylinder(r=8.5/2, h=20);
    translate([0, 0, 5])
      rotate([0, 90, 0])
      {
        translate([0, 0, 5])
          nut_space_();
        translate([0, 0, -10])
          cylinder(r=3.5/2, h=20);
      }
  }
}


main_handle_();
translate([27, 0, 0])
  block_();
