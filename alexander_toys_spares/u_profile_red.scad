eps = 0.01;

module u_profile_red(n)
{
  d = 4;
  vert_wall = 11.0;
  d2d = 6.0;
  d2e_v = 3.3;
  d2e_h = 4.0;
  w = 10.15;
  h = 1.06;
  l = (n-1)*d2d + n*d + 2*d2e_h;
  wall_h = 11;

  // lower side
  l_size = [l, w, h];
  difference()
  {
    translate([-l_size[0]/2, -l_size[1]/2, 0])
      cube(l_size);
    // screw holes
    off_x = (n%2==1) ? 0 : d2d/2 + d/2;
    for(i=[0:floor(n/2)])
      for(dx=[-1,+1])
        translate([dx*(off_x + i*(d2d+2*d/2)), 0, -eps])
          cylinder(d=d, h=h+2*eps, $fn=60);
  }
  // walls
  for(dx=[-1,+1])
    translate([dx*(l_size[0]-h)/2, 0, 0])
      difference()
      {
        // wall
        hull()
        {
          translate([-h/2, -w/2, 0])
            cube([h, w, h]);
          translate([-h/2, 0, wall_h-w/2])
            rotate([0, 90, 0])
              cylinder(d=w, h=h, $fn=60);
        }
        // screw hole
        translate([-h/2-eps, 0, wall_h-d2e_v-d/2])
          rotate([0, 90, 0])
            cylinder(d=d, h=h+2*eps, $fn=60);
      }
}

u_profile_red(n=7);
