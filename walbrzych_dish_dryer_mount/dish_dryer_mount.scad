module _main_block()
{
  hull()
  {
    for(dx=[0, 33-2*2])
      for(dy=[0, 14-2*2])
        translate([dx,dy,0])
          cylinder(r=2, h=30, $fn=20, center=false);
  }
}

module part(d)
{
  difference()
  {
    _main_block();
    // holes
    for(dx=[0, 19])
      translate([dx+7-2, 14/2-2, 30-23])
        cylinder(r=d/2, h=23+1, $fn=50);
  }
}


ds=[6.25, 6.5, 6.75];
for(i=[0:len(ds)-1])
  for(set=[0:1])
    translate([set*(30+5), i*(14+5), 0])
      part(d=ds[i]);
