wall = 1.75;
spacing = 1.3;
l = 3.2;
size = [90+2*wall, 41, 15];

module tooth_()
{
  size = 4;
  difference()
  {
    cube([l, size, 16]);
    translate([0, 0, 16+l/2.5])
      rotate([0, 45, 0])
        translate([0, 0, -l])
          cube([l, size, 2*l]);
  }
}

module element()
{
  // body
  difference()
  {
    cube(size);
    translate(wall*[1, 0, 1])
      cube(size - wall*[2, 1, 1]);
  }
  
  // side teeth
  for(dy=[5, 25])
    translate([wall+spacing, dy, wall])
    {
      tooth_();
      translate([size[0]-2*(wall+spacing), wall, 0])
        rotate([0, 0, 180])
          tooth_();
    }
  
  // upper teeth
  for(dx=[0:3])
    translate([wall + 15 + dx*18.5, size[1]-wall-spacing-l, 0])
      translate([0, l, 0])
        rotate([0, 0, -90])
          tooth_();
}

element();
