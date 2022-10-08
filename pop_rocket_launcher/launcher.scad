eps = 0.01;
wall = 1.3;

launch_side = 22;
launch_h = 180;

conn_phi = 25;
conn_h = 20;
conn_pipe_space = 4;


module screw_mount(dl)
{
  s = 10;
  h = 5;
  difference()
  {
    translate([-s/2, -s/2, 0])
      cube([s, s+dl, h]);
    translate([0, 0, -eps])
      cylinder(d=4, h=h+2*eps, $fn=50);
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
  translate([-conn_phi/2, -conn_phi-conn_pipe_space, 0])
    cube([conn_phi, conn_phi+conn_pipe_space+wall, dz]);
}


module inner_pipe()
{
  // rocket side
  translate([0, launch_h+2*eps, 0])
    rotate([90, 0, 0])
      linear_extrude(height=launch_h+4*eps)
        triangle_2d_int(launch_side);
  // rubber pipe side
  dz = launch_side * sin(60);
  translate([0, -conn_phi/2, dz])
    pipe_connector(conn_phi-2*wall, 20+eps);
  // smooth interconenction of both
  hull()
  {
    // launch side
    rotate([90, 0, 0])
      linear_extrude(height=eps)
        triangle_2d_int(launch_side);
    // top-level connection facing side
    translate([0, -conn_phi/2, dz])
      pipe_connector(conn_phi-2*wall, 0.1, $fn=50);
    // gradual narrowing of the pipe
    denom = 10;
    translate([0, 0, dz-1.5])
      for(r=[0:5:60])
        rotate([r, 0, 0])
          translate([0, -(conn_phi-r/denom)/2, 0])
            pipe_connector(conn_phi-2*wall-r/denom, 0.1, $fn=50);
  }
}


module launcher()
{
  difference()
  {
    outer_pipe();
    inner_pipe();
  }
  // mount screw holes
  translate([0, -conn_phi-conn_pipe_space, 10])
    rotate([-90, 0, 0])
      for(dx=[-1,+1])
        translate([dx*(conn_phi/2 + 10/2), 0, 0])
          screw_mount(dl=10/2);
}

launcher();
