$fn=30;

corrners = [ [-1,-1,0], [-1,+1,0], [+1,-1,0], [+1,+1,0] ];

// wall-mounted part
module wall(tr, size)
{
  translate(tr)
    hull()
      difference()
      {
        for(t = corrners)
        {
          off = [size[0]/2*t[0], size[1]/2*t[1], 0*t[2]];
            translate(off)
              sphere(size[2]);
        };
        translate([0,0,-size[2]]) cube(2*size, center=true);
      }
}

// water drops catching plane
module plane(tr, size)
{
  rotate([90,0,0])
    translate(tr)
      hull()
        for(t = corrners)
        {
          off = [size[0]/2*t[0], size[1]/2*t[1], 0*t[2]];
            translate(off)
              sphere(size[2]);
        };
}

// element for holding a single brush
module holder(tr, size)
{
  translate(tr)
  {
    cube([size[0], 7, size[2]]);
    translate([1.5, 7, size[2]-3])
      rotate([-90,0,0])
      {
        cylinder(r=(8-1.5)/2, h=7+2);
        cylinder(r=(3-1)/2, h=14+2);
      }
  }
}


wall([0,0,0], [36,50,2]);
plane([0,16.5,50/2-2], [36-2*2,29,2]);
holder([20/2-1,-1,2], [3,25,18]);
holder([-20/2-1,-1,2], [3,25,18]);
