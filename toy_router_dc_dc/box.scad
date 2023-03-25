eps = 0.01;
int_size = [55, 30, 20];
wall = 1;
ext_size = int_size + wall * [2,2,2];


module top()
{
  w = wall + 0.5;
  cube([ext_size[0], ext_size[1], wall]);
  translate(w*[1,1,0])
    cube([ext_size[0]-2*w, ext_size[1]-2*w, wall+w]);
}


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


top();

translate([0, ext_size[1]+3, 0])
  bottom();
