eps=0.01;
//wall=1;
//hose_phi=6;
//bottle_screw_phi=27.4 + 0.6;
//bottle_screw_h=9;
side = 22;

module screw_mount()
{
  s = 10;
  h = 5;
  difference()
  {
    translate([-s/2, -s/2, 0])
      cube([s, s, h]);
    translate([0, 0, -eps])
      #cylinder(d=4, h=h+2*eps, $fn=50);
  }
}

module triangle_2d(side)
{
  dx = -side/2;
  dy = -side/2 * sin(30);
  translate([dx, dy, 0])
  polygon( points=[
    [0, 0],
    [side, 0],
    [cos(60)*side, sin(60)*side]
  ] );
}

module triangle_pipe(side, height)
{
  linear_extrude(height=height)
    difference()
    {
      triangle_2d(side);
      triangle_2d(side-6);
    }
}


module launcher_core()
{
  dx = 40+22+6;
  module pad_core()
  {
    // pipe mount
    translate([50, 0, 11])
      cylinder(d=6, h=10, $fn=50);
    difference()
    {
      // block
      translate([-side/2, -side/2+0.75, 0])
        cube([dx, side, 11]);
      // triangle cut at the basecut
      translate([0, 0, 2+eps])
        rotate([0, 0, -30])
          linear_extrude(height=9)
            triangle_2d(12);
    }
    // launcher tube
    rotate([0, 0, -30])
      triangle_pipe(side, 180);
  }

  difference()
  {
    pad_core();
    // cut in for pressure to get in
    translate([50, 0, 10-6/3])
      cylinder(d=6-2, h=11+6/3+eps, $fn=50);
    // pipe hole
    translate([1-4, 0, 8/2+1])
      rotate([0, 90, 0])
        cylinder(d=8, h=dx-side/2, $fn=30);
  }
}


module launcher()
{
  launcher_core();
  for(dy=[-15, 16])
    translate([20, dy, 0])
      screw_mount();
}

launcher();
