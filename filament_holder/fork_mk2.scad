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
      cylinder(h=h, r=(80+2*w)/2);
      translate([-(80+2*w)/2, 0, 0])
        cube([80+2*w, (80+2*w)/2, h]);
      cylinder(h=h, r=(80)/2);
    }

    // leg
    translate([-w/2,-80-80/2,0])
      cube([w, 80, h]);

    // forks
    translate([40, 0, 0])
      cube([w, 40, h]);
    translate([-40-w, 0, 0])
      cube([w, 40, h]);
  }

  // lower hole for screw
  translate([0, -80-34.5, -1])
    cylinder(h=h+2, r=d);
  // higher hole for screw
  translate([0, -80-34.5+11, -1])
    cylinder(h=h+2, r=d);
}
