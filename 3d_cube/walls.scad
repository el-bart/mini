w=0.4;

difference()
{
  cube([20, 20, 20]);
  translate([w,w,0])
    cube([20-2*w, 20-2*w, 20]);
}
