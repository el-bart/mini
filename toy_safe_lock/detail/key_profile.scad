include <config.scad>
include <../m3d/all.scad>


module key_porifle()
{
  circle(d=key_d, $fn=fn(40));
  translate([-key_insert_d/2, -key_insert_h])
    square([key_insert_d, key_insert_h]);
}


key_porifle();
