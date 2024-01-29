module razor_blade_dumpster(wall = 0.5)
{
  eps = 0.01;
  h = 0.2;  // h of a single blade
  N = 20;
  side_cut_wide = 10;
  in_size = [ 43+2, 22+2, h*N+wall+10];
  difference()
  {
    cube(in_size);
    translate(wall*[1,1,1])
      cube(in_size - wall*[2,2,0]);
    // side cut
    translate([-eps, in_size.y/2 - side_cut_wide/2, wall])
      cube([wall+2*eps, side_cut_wide, in_size.z]);
  }
}


razor_blade_dumpster();
