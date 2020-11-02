size = [92.75, 41, 15];
wall = 1.75;
spacing = 2;
l = 3.2;

module tooth()
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
    tooth();
    translate([size[0]-2*(wall+spacing), wall, 0])
      rotate([0, 0, 180])
        tooth();
  }

// upper teeth
for(dx=[0:3])
  translate([wall + 15 + dx*18.5, size[1]-wall-spacing-l, 0])
    translate([0, l, 0])
      rotate([0, 0, -90])
        tooth();
