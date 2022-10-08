module fin()
{
  translate([1/2, 0, 1])
    rotate([0, -90, 0])
      linear_extrude(1)
        polygon(points=[
          [ 0,  0],
          [40,  0],
          [40, 10],
          [ 0, 30]
        ]);
  // base
  translate([-4/2, 0, 0])
    cube([4, 30, 1]);
}

for(i=[0:3])
  translate([i*6, 0, 0])
    fin();
