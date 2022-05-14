use <m3d/rounded_cube.scad>

eps = 0.01;
wall = 2;
box_size = [60, 35, 20];
roundings = 3;
split_h = 5;
int_size = box_size - 2*wall*[1,1,1];

module box_main()
{
  difference()
  {
    
    rounded_cube(box_size, roundings, $fn=40);
    // empty interior
    translate(wall*[1,1,1])
      rounded_cube(int_size, roundings-wall, $fn=40);
    // holes for cable
    translate([-eps, box_size[1]/2, 3.25/2+roundings])
    rotate([0, 90, 0])
      hull()
        for(dy=[-1, +1])
          translate([0, dy*(5.5-2*3.5/2)/2, 0])
            cylinder(d=3.5, h=box_size[0]+2*eps, $fn=30);
  }
}

module box_bottom()
{
  intersection()
  {
    box_main();
    cube(box_size - [0, 0, split_h]);
  }
}

module box_top()
{
  // cover
  intersection()
  {
    translate([0, box_size[1], box_size[2]])
      rotate([180, 0 , 0])
        box_main();
    cube([box_size[0], box_size[1], split_h]);
  }
  // side walls for glueing
  translate(wall*[1,1,1])
  {
    difference()
    {
      cube([int_size[0], int_size[1], split_h+3]);
      // just keep walls
      translate(1.2*[1,1,0])
        cube(int_size-2*1.2*[1,1,1]);
      // corners removed for more flexibility
      for(dx=[0,1])
        for(dy=[0,1])
          translate([dx*int_size[0], dy*int_size[1], 0])
            translate(-10/2*[1,1,0])
              cube([10, 10, int_size[2]]);
      // minimize size of side walls
      translate([box_size[0]/2 - int_size[0]/3/2 - wall, -eps, 0])
        cube([int_size[0]/3, box_size[1], int_size[2]]);
    }
  }
}

box_top();
translate([0, -box_size[1]-3, 0])
  box_bottom();
