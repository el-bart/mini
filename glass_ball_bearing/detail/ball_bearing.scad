use <../m3d/fn.scad>

function ball_bearing_ball_location_r(d_in, d_ball, d_out, h, n, wall, spacing)
  = d_out/2 - wall - spacing - d_ball/2;

module ball_bearing_ball_locations(d_in, d_ball, d_out, h, n, wall, spacing)
{
  r = ball_bearing_ball_location_r(d_in, d_ball, d_out, h, n, wall, spacing);
  for(i=[0:n-1])
    rotate(360/n*[0, 0, i])
      translate([0, r, 0])
        sphere(d=d_in+2*spacing);
}

module ball_bearing_ball_slot(d_in, d_ball, d_out, h, n, wall, spacing)
{
  r = ball_bearing_ball_location_r(d_in, d_ball, d_out, h, n, wall, spacing);
//  for(i=[0:n-1])
//    rotate(360/n*[0, 0, i])
//      translate([0, r, 0])
        sphere(d=d_in+2*spacing);
}

module ball_bearing_inner_ring(d_in, d_ball, d_out, h, n, wall, spacing)
{
}

module ball_bearing_outer_ring(d_in, d_ball, d_out, h, n, wall, spacing)
{
}

module ball_bearing_cage(d_in, d_ball, d_out, h, n, wall, spacing)
{
}


module ball_bearing_outer_ring(d_in, d_ball, d_out, h, n, wall, spacing)
{
}


//ball(d=4, spacing=0, $fn=fn(100));

ball_bearing_ball_slot(d_in=5, d_ball=4, d_out=40, h=10, n=5, wall=2, spacing=0.5, $fn=fn(50));
