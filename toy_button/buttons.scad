eps=0.01;

module button_flat()
{
  difference()
  {
    cylinder(r=15/2, h=2, $fn=120);
    for(dx=[-1,1])
      translate([dx*2.5, 0, -eps])
        cylinder(r=2/2, h=2+2*eps, $fn=30);
  }
}

module button_thick()
{
  difference()
  {
    union()
    {
      cylinder(r=15/2, h=2, $fn=120);
      translate([0, 0, 2])
        resize((15-3)*[1, 1, 0] + [0, 0, 4])
          sphere(r=(15-3)/2, $fn=120);
    }
    for(dx=[-1,1])
      translate([dx*2.5, 0, -eps])
        cylinder(r=2/2, h=4+2*eps, $fn=30);
  }
}

for(i=[0:1])
  translate([0, i*17, 0])
    button_flat();

for(i=[0:0])
  translate([17, i*17, 0])
    button_thick();
