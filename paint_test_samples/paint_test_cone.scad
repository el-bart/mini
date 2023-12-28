eps = 0.01;

module paint_test_cone(base, wall)
{
  module body()
  {
    translate(base/2*[-1, -1, 0])
      cube([base, base, wall]);
    diag = sqrt(2)*base;
    for(r=[45, 45+90])
      rotate([0, 0, r])
        translate([-diag/2, -wall/2, 0])
          cube([diag, wall, diag]);
  }

  module selector()
  {
    hull()
    {
      translate(base/2*[-1, -1, 0])
        cube([base, base, eps]);
      translate([0, 0, base])
        cube(eps*[1,1,1], center=true);
    }
  }

  intersection()
  {
    body();
    selector();
  }
}


paint_test_cone(base=20, wall=1);
