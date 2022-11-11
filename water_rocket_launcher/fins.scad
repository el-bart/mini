module fin()
{
  translate([1/2, 0, 1])
    rotate([0, -90, 0])
      linear_extrude(1)
        polygon(points=[
          [ 0,  0],
          [80, 10],
          [80, 20],
          [ 0, 60]
        ]);
  // base
  translate([-6/2, 0, 0])
    cube([6, 60, 1]);
}

for(i=[0:3])
  translate([i*8, 0, 0])
    fin();
