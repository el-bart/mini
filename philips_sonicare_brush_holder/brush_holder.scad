names=["John", "Jane"];


module rounded_surface_(size)
{
  r=size[2]/2;
  translate([0, 0, r])
    hull()
      for(dx=[r, size[0]-r])
        for(dy=[r, size[1]-r])
          translate([dx, dy, 0])
            sphere(r=r, $fn=r*10); // TODO: r*20!
}

module rounded_half_surface_(size)
{
  translate([0, 0, -size[2]/2])
    difference()
    {
      rounded_surface_(size);
      translate(size[2]/2*[0,0,-1])
        cube(size);
    }
}




corrners = [ [-1,-1,0], [-1,+1,0], [+1,-1,0], [+1,+1,0] ];

// wall-mounted part
module wall(size)
{
  hull()
    difference()
    {
      #for(t = corrners)
      {
        off = [size[0]/2*t[0], size[1]/2*t[1], 0*t[2]];
          translate(off)
            sphere(size[2]);
      };
      translate([0,0,-size[2]]) cube(2*size, center=true);
    }
}

// water drops catching plane
module plane(size)
{
  translate([0, 0, size[1]/2])
    rotate([90,0,0])
      hull()
        for(t = corrners)
        {
          off = [size[0]/2*t[0], size[1]/2*t[1], 0*t[2]];
            translate(off)
              sphere(size[2]);
        };
}

// element for holding a single brush
module holder(size)
{
  cube([size[0], 7, size[2]]);
  translate([1.5, 7, size[2]-3])
    rotate([-90,0,0])
    {
      cylinder(r=(8-1.5)/2, h=7+2);
      cylinder(r=(3-1)/2, h=14+2);
    }
}


module brush_holder()
{
  translate([0, -23.25, 0])
    rotate([90, 0, 0])
      rounded_surface_([36-2*2, 29, 2]);
  translate(1/2*[36, 50, 0]) // TODO: temporary
  {
  translate(-1/2*[36,50, 0])    // TODO: to be removed
    rounded_half_surface_([36, 50, 5]);

  for(dx=[-1, +1])
    translate([dx*20/2-1, -1, 2])
      holder([3,25,18]);
  }
}


brush_holder();


//rounded_surface_([20,30,5]);
//rounded_half_surface_([20,30,5]);
