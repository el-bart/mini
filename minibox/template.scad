module _rounded_box(dim, r)
{
  //%cube(dim);
  hull()
  {
    for(dx=[r, dim[0]-r])
      for(dy=[r, dim[1]-r])
        translate([dx, dy, 0])
          cylinder(r=r, h=dim[2], $fn=100);
  }
}


module minibox(dim, r, wall)
{
  difference()
  {
    _rounded_box(dim, r);
    translate(wall*[1,1,1])
      _rounded_box(dim-2*wall*[1,1,0], r);
  }
}


minibox([30, 20, 10], 2, 2);
