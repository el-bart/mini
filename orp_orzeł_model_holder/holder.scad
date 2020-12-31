eps = 0.01;
spacing = 4;
size = [74.1+2*spacing, 32.2+2*spacing];
rounding = 5;

module holder_()
{
  z=2;
  x=74.1;
  y=32.2;
  w=3.08;
  for(dx=[0, x-w])
    translate([dx,0,0])
    {
      cube([w, y, z]);
      translate(6*[0, 1/2, 0])
        cube([w, y-6, z+20]);
    }
  translate([0, y/2-w/2, z])
    cube([x, w, z]);
}

module holder_space_()
{
  space=2;
  z=2-0.5;
  x=74.1;
  y=32.2+2*space;
  w=3.08+2*space;
  for(dx=[0, x-w+2*space])
    translate([dx, 0, 0])
      cube([w, y, z]);
}

module main_block_()
{
  // desk mount
//  difference()
//  {
//    cube([size[0], 19+2*2, 20+4]);
//    translate([-eps, 2, 4])
//      cube([size[0]+2*eps, 19, 20+1]);
//  }
  // main surface
  for(i=[0])//, size[0]-rounding])
    translate([i, 0, 0])
      hull()
      {
        cube([2*rounding+2, 1, 3]);
        for(j=[0, spacing])
          #translate(spacing*[1,0,0] + [j+1, size[1], 0])
            cylinder(r=rounding, h=3, $fn=120);
      }
}


module holder()
{
  difference()
  {
    main_block_();
    translate([2, spacing, 0])
      #holder_space_();
    translate(2*[1, 1, 0] + [size[0]-spacing-2, spacing, 1.5])
      rotate([0, 180, 0])
        %holder_();
  }
}

holder();
