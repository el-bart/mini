module rounded_surface_(size, r)
{
  assert(len(size)==2);
  hull()
    for(dx=[r, size[0]-r])
      for(dy=[r, size[1]-r])
        translate([dx, dy, r])
          sphere(r=r, $fn=r*3); // TODO: r*10!
}

module rounded_half_surface_(size, r)
{
  assert(len(size)==2);
  translate([0, 0, -r])
    difference()
    {
      rounded_surface_(size, r);
      cube([size[0], size[1], r]);
    }
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


module whole_holder(names)
{
  translate([0, 5+1, -5])
    rotate([90, 0, 0])
      difference()
      {
        rounded_surface_([36, 35], 3);
        cube([36, 5, 3*2]);
      }
  rounded_half_surface_([36, 50], 5);
  translate(1/2*[36, 50, 0]) // TODO: temporary
  {
  for(dx=[-1, +1])
    translate([dx*20/2-1, -1, 2])
      holder([3,25,18]);
  }
}


whole_holder(["John", "Jane"]);
//rounded_surface_([36, 5, 30], 3/2);


//rounded_surface_([30, 20], 3);
//rounded_half_surface_([30, 20], 5);
