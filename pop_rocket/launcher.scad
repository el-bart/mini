eps = 0.01;
phi = 25;
wall = 1.3;
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
  dy = 0;
  translate([dx, 0, 0])
  polygon( points=[
    [0, 0],
    [side, 0],
    [cos(60)*side, sin(60)*side]
  ] );
}


module triangular_prism(side, height)
{
  linear_extrude(height=height)
    triangle_2d(side);
}


module pipe_connector(d, h)
{
  cylinder(d=d, h=h, $fn=200);
}


module inner_pipe()
{
  // rocket side
  ph = 180;
  translate([0, ph, 0])
    rotate([90, 0, 0])
      triangular_prism(side, ph);
  // rubber pipe side
  dz = side * sin(60);
  translate([0, -phi/2, dz])
    pipe_connector(phi, 20);
  // interconenction of both
  hull()
  {
    rotate([90, 0, 0])
      triangular_prism(side, 0.1);
    translate([0, 0, dz])
      for(r=[0:5:40])
        rotate([r, 0, 0])
          translate([0, -phi/2, 0])
            pipe_connector(phi-r/5, 0.1, $fn=50);
  }
}


module launcher()
{
  inner_pipe();
}

launcher();
