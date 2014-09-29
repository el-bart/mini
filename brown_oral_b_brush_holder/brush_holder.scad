/*
 * Brown Orla-B brush holder (wall-attached).
 */
$fn=10;

module wall(tr, size)
{
  translate(tr)
    hull()
      difference()
      {
        for(t=[ [-1,-1,0], [-1,+1,0], [+1,-1,0], [+1,+1,0] ])
        {
          assign( off = [size[0]/2*t[0], size[1]/2*t[1], 0*t[2]] )
            translate(off)
              sphere(size[2]);
        };
        translate([0,0,-size[2]]) cube(2*size, center=true);
      }
}


wall([0,0,0], [36,50,2]);