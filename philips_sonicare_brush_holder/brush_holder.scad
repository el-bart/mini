// TODO: add names engravings

module rounded_surface_(size, r)
{
  assert(len(size)==2);
  hull()
    for(dx=[r, size[0]-r])
      for(dy=[r, size[1]-r])
        translate([dx, dy, r])
          sphere(r=r, $fn=r*20);
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
  translate([-4/2, 0, 0])
    cube([4, 7, 17]);
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
  assert( len(names) > 0 );
  r=5;
  spacing=20;
  total_len=2*(r+3) + spacing*(len(names)-1) + 4;

  // plate
  translate([0, r+2, -r])
    rotate([90, 0, 0])
      difference()
      {
        rounded_surface_([total_len, 35], r/2+1);
        cube([total_len, r, r*2]);
      }
  // back wall
  rounded_half_surface_([total_len, 50], r);
  // holders
  for(i=[0:len(names)-1])
    translate([r+3+4/2, 25, r-1] + i*[spacing, 0, 0])
      holder();
}


whole_holder(["John", "Jane", "Jackob"]);
