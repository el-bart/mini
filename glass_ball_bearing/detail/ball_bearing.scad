use <../m3d/fn.scad>

function ball_bearing_ball_location_r(d_in, d_ball, d_out, n, wall, spacing, cage_spacing)
  = d_out/2 - wall - spacing - d_ball/2;
function ball_bearing_h(d_in, d_ball, d_out, n, wall, spacing, cage_spacing)
  = d_ball + 2*(spacing+wall);

cage_cut_fraction = 3/4; // part of d_ball that's exposed


module ball_bearing_ball_locations(d_in, d_ball, d_out, n, wall, spacing, cage_spacing)
{
  r = ball_bearing_ball_location_r(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
  for(i=[0:n-1])
    rotate(360/n*[0, 0, i])
      translate([0, r, 0])
        sphere(d=d_in+2*spacing);
}

module ball_bearing_ball_slot(d_in, d_ball, d_out, n, wall, spacing, cage_spacing)
{
  r = ball_bearing_ball_location_r(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
  rotate_extrude(angle=360)
    translate([r, 0])
      circle(d=d_ball + 2*spacing);
}

module ball_bearing_cage_space(d_in, d_ball, d_out, n, wall, spacing, cage_spacing)
{
  h = ball_bearing_h(d_in, d_ball, d_out, n, wall, spacing) + 1;
  r = ball_bearing_ball_location_r(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
  x = cage_cut_fraction * d_ball;
  r_out = r + x/2;
  r_in = r - x/2;
  difference()
  {
    cylinder(r=r_out, h=h, center=true);
    cylinder(r=r_in, h=h+1, center=true);
  }
}

module ball_bearing_cage_space_core(d_in, d_ball, d_out, n, wall, spacing, cage_spacing)
{
  h = ball_bearing_h(d_in, d_ball, d_out, n, wall, spacing);
  r = ball_bearing_ball_location_r(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
  x = cage_cut_fraction * d_ball;
  r_out = r + x/2 - cage_spacing;
  r_in = r - x/2 + cage_spacing;
  difference()
  {
    cylinder(r=r_out, h=h, center=true);
    cylinder(r=r_in, h=h+1, center=true);
  }
}

module ball_bearing_core(d_in, d_ball, d_out, n, wall, spacing, cage_spacing)
{
  h = ball_bearing_h(d_in, d_ball, d_out, n, wall, spacing);
  r = ball_bearing_ball_location_r(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
  difference()
  {
    cylinder(d=d_out, h=h, center=true);
    cylinder(d=d_in+2*spacing, h=h+1, center=true);
    ball_bearing_ball_slot(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
    ball_bearing_cage_space(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
  }
}

module ball_bearing_half_cage(d_in, d_ball, d_out, n, wall, spacing, cage_spacing)
{
  h = ball_bearing_h(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
  difference()
  {
    ball_bearing_cage_space_core(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
    ball_bearing_ball_locations(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
    translate([0, 0, h/2])
      cube((d_out+1)*[1, 1, 0] + [0,0,h], center=true);
  }
}



if(false)
{
  difference()
  {
    d_in=5;
    d_ball=4;
    d_out=30;
    n=6;
    wall=2;
    spacing=0.5;
    cage_spacing=0.5;
    $fn=fn(70);

    union()
    {
      ball_bearing_core(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
      #ball_bearing_half_cage(d_in, d_ball, d_out, n, wall, spacing, cage_spacing);
    }

    if(0)
      translate([0, -50, -50])
        cube([100, 100, 100]);
  }
}
