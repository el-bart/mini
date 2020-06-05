module clip()
{
  difference()
  {
    cube([2*2+9, 2*10+2, 10]);
    #translate([2, 2*10+2-10, 0])
      cube([8.5, 10, 10]);
    #translate([2, 0, 0])
      cube([9, 10, 10]);
  }
}

for(i=[0:2])
  translate(i*[14,0,0])
    clip();
