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
module holder()
{
  translate([-3/2, 0, 0])
    cube([3, 7, 17]);
  translate([0, 0, 17-2])
  {
    rotate([-90, 0, 0])
      cylinder(r=(8-1.5)/2, h=7+2+7, $fn=50);
    translate([0, 7, 0])
      rotate([-90,0,0])
        cylinder(r=(3-1)/2, h=14+2, $fn=30);
  }
}


module whole_holder(names)
{
  // plate
  translate([0, 5+1, -5])
    rotate([90, 0, 0])
      difference()
      {
        rounded_surface_([36, 35], 3);
        cube([36, 5, 3*2]);
      }
  // back wall
  rounded_half_surface_([36, 50], 5);
  // holders
  for(i=[0:len(names)-1])
    translate([7+i*20, 25, 4])
      holder();
}


whole_holder(["John", "Jane", "Jackob"]);
