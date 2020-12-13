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
  translate([-3/2, 0, 17-2])
    cube([3, 25, 6]);
}


module whole_holder(names)
{
  assert( len(names) > 0 );
  r=5;
  spacing=20;
  total_len=2*(r+6) + spacing*(len(names)-1) + 4;

  // plate
  translate([0, r+2, -r])
    rotate([90, 0, 0])
      difference()
      {
        rounded_surface_([total_len, 40], r/2+1);
        cube([total_len, r, r*2]);
      }
  // back wall
  rounded_half_surface_([total_len, 60], r);
  // holders + names
  translate([r+6+4/2, 25, r])
  {
    for(i=[0:len(names)-1])
      translate(i*[spacing, 0, 0])
      {
        holder();
        #translate([0, 25, 0])
          linear_extrude(3*0.2)
            text(names[i], size=4, halign="center");
      }
  }
}


whole_holder(["John", "Jane", "Jackob"]);
