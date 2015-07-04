r=(3+2)/2;

difference()
{
  // main element
  cube([17, 6, 3]);
  // spherical holes
  for(offset = [0.5, 17-2*r-0.5])
    translate([r+offset, 6/2, 3])
      sphere(r=r, $fs=0.01);
  // string entry/exit points
  for(offset = [-0.5, 17-2+0.5])
    translate([offset, 0, 0] + [0, 6/2, 6/2])
      rotate([0, 90, 0])
        cylinder(r=(1+0.5)/2, h=2, $fs=0.01);
}
