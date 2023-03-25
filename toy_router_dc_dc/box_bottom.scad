include <detail/config.scad>

module bottom()
{
  difference()
  {
    cube(ext_size - [0,0,wall]);
    // inner cut
    translate(wall*[1,1,1])
      cube(int_size + [0,0,eps]);
    // ventilation holes
    {
      d = 5;
      for(ix=[0:2*d:int_size[0]-2*d])
        for(iy=[0:2*d:int_size[1]-d])
          translate((wall+d)*[1,1,0] + [2,0,0] + [ix, iy, -eps])
            cylinder(d=d, h=3*wall);
    }
    // cable holes
    {
      h = wall*2+5;
      translate([-eps, ext_size[1]/2-4/2, ext_size[2]-h])
        cube([ext_size[0]+2*eps, 4, h]);
    }
  }
}

bottom();
