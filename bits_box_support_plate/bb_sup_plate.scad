module plate()
{
  h = 1;
  r = 7;
  spacing = 1.5;
  size = [85, 114.35] - 2*spacing*[1,1];

  linear_extrude(h)
    hull()
      for(dx=[-1, +1])
        for(dy=[-1, +1])
          translate([dx*size.x/2, dy*size.y/2])
            circle(r=r);
}

plate();
