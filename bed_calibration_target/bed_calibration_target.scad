size = 320; // make it large, but smaller then the bed
spacing = 50;
wall = 2;
h = 1.5;

module base()
{
  $fn=90;

  for(d = [size : -spacing : wall])
    difference()
    {
      circle(d=d);
      circle(d=d-2*wall);
    }
  // center
  circle(d=2*wall);
  for(r=[0, 90])
    rotate([0, 0, r])
      square([wall, size], center=true);
}


linear_extrude(h)
  base();
