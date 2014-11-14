h=11;      // height
w=14;      // width
d=(5+1.5)/2; // diameter of the holes

difference()
{
  union()
  {
    // lower arc
    difference()
    {
      cylinder(h=h, r=(50+2*w)/2);
      translate([-(50+2*w)/2, 0, 0])
        cube([50+2*w, (50+2*w)/2, h]);
      cylinder(h=h, r=(50)/2);
    }

    // leg
    translate([-w/2,-80-50/2,0])
      cube([w, 80, h]);

    // forks
    translate([25, 0, 0])
      cube([w, 30, h]);
    translate([-25-w, 0, 0])
      cube([w, 30, h]);
  }

  // lower hole for screw
  translate([0, -80-19.5, -1])
    cylinder(h=h+2, r=d);
  // higher hole for screw
  translate([0, -80-19.5+11, -1])
    cylinder(h=h+2, r=d);
}
