wall=1.5;
eps = 0.01;

module box_bottom()
{
  size = [50, 60, 40];
  difference()
  {
    cube(size);
    translate(wall*[1,1,1])
      cube(size-wall*[2,2,0]);
    // arduino USB socket
    translate([size[0]-8-9, -eps, 30])
      cube([9, 2*eps+wall, 5]);
    // servo wires
    translate([wall, size[1]-wall-eps, wall])
      cube([9, 3, 3*wall]);
  }
  // arduino support
  translate([50-8-9-0.5, wall, 0])
    cube([10, 20, 26]);
  // servo info note
  color("blue")
  translate([wall+12, size[1]+0.5, wall+5])
    rotate([90, 0, 0])
      mirror([1, 0, 0])
        linear_extrude(1)
          text("~+-", size=6);
}

box_bottom();
