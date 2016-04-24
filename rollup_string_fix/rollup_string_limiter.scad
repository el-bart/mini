module rollup_string_limiter(r)
{
  difference()
  {
    // main element
    cube([16, 6, 3]);
    // spherical holes
    for(offset = [0, 2*r, 4*r, 6*r])
      translate([r+offset, 6/2, 3])
        sphere(r=r, $fs=0.01);
    // string entry/exit points
    translate([-0.5, 6/2, 6/2])
      rotate([0, 90, 0])
        cylinder(r=(1+0.5)/2, h=17+1, $fs=0.01);
  }
}

rollup_string_limiter( (3+1)/2 );
