module support()
{
  thick=3;
  d=7+2*thick;
  ox=2*20+d;
  difference()
  {
    union()
    {
      cube([ox, 20, thick]);
      translate([ox/2, 0, thick])
        rotate([-90, 0, 0])
          cylinder(r=d/2, h=20, $fn=50);
    }
    translate([ox/2, 0, thick])
    {
      rotate([-90, 0, 0])
        cylinder(r=d/2-thick, h=20, $fn=50);
      translate([-(d-2*thick)/2, 0, -10])
        cube([d-2*thick, 20, 10]);
    }
    translate([0,0,-10])
      cube([ox, 20, 10]);
  }
}

for(i=[0:2])
  translate(i*[0, 20+5, 0])
    support();
