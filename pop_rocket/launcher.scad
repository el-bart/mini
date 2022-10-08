eps = 0.01;
wall = 1.3;

launch_side = 22;
launch_h = 180;

conn_phi = 25;
conn_h = 20;


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


module triangle_2d_int(side)
{
  offset(r=-wall)
    triangle_2d(side);
}


module pipe_connector(d, h, $fn=200)
{
  cylinder(d=d, h=h);
}


module outer_pipe()
{
  // rocket side
  translate([0, launch_h+eps, 0])
    rotate([90, 0, 0])
      linear_extrude(height=launch_h)
        triangle_2d(launch_side);
  // rubber pipe side
  dz = launch_side * sin(60);
  translate([0, -conn_phi/2, dz])
    pipe_connector(conn_phi, 20);
  // interconenction of both
  translate([-conn_phi/2, -conn_phi, 0])
    cube([conn_phi, conn_phi, dz]);
}


module inner_pipe()
{
  // rocket side
  translate([0, launch_h+eps, 0])
    rotate([90, 0, 0])
      linear_extrude(height=launch_h+2*eps)
        triangle_2d_int(launch_side);
  // rubber pipe side
  dz = launch_side * sin(60);
  translate([0, -conn_phi/2, dz])
    pipe_connector(conn_phi-2*wall, 20+eps);
  // interconenction of both
  /*
  hull()
  {
    rotate([90, 0, 0])
      triangular_prism(launch_side, 0.1);
    translate([0, 0, dz])
      for(r=[0:5:40])
        rotate([r, 0, 0])
          translate([0, -conn_phi/2, 0])
            pipe_connector(conn_phi-r/5, 0.1, $fn=50);
  }
  */
}


module launcher()
{
  difference()
  {
//    outer_pipe();
    inner_pipe();
  }
  // TODO screw holes :P
}

launcher();
