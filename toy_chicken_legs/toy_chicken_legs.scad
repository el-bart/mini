mount_size = [7, 1.7, 5.1];
leg_span = 12;
leg_h = 11.4;


module ball()
{
  sphere(d=2.1, $fn=20);
}


module foot()
{
  for(off = [
             [0, 6, 0],
             [0, -9.5, 0],
             [4.8, -4.5, 0],
             [-4.8, -4.5, 0]
           ])
  {
    hull()
    {
      ball();
      translate(off)
        ball();
    }
  }
}


module mount()
{
  s = mount_size;
  translate([ -s[0]/2, -s[1]/2, leg_h])
    cube(s);
}

module legs()
{
  deltas = [leg_span/2, mount_size[0]/2-1];
  for(sgn = [-1, +1])
  {
    hull()
    {
      translate([sgn*deltas[0], 0, 0])
        ball();
      translate([sgn*deltas[1], 0, leg_h])
        ball();
    }
  }
}


mount();

legs();

for(dx=[-1, +1])
  translate([dx*leg_span/2, 0, 0])
    foot();
