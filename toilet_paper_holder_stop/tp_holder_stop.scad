$fs=0.01;
h=7;
spacing=20;

module holderStop(phi)
{
  difference()
  {
    cylinder(r=phi/2+3, h=h);
    cylinder(r=phi/2,   h=h);
  }
}


// make different sizes
for(i = [0, 1, 2])
  // pack of 2 for each end of the holder
  for(j = [0, spacing])
    translate([j, i*spacing, 0])
      holderStop(6+1 + i*1/3);
