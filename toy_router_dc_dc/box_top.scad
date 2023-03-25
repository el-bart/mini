include <detail/config.scad>


module top()
{
  w = wall + 0.5;
  cube([ext_size[0], ext_size[1], wall]);
  translate(w*[1,1,0])
    cube([ext_size[0]-2*w, ext_size[1]-2*w, wall+w]);
}

top();
