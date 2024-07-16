module holder()
{
  wall = 2;
  h = 74 + 2*wall;

  module side_2d()
  {
    // base
    square([wall, 20]);
    translate([wall + 19, 0])
      square([wall, 20]);
    // upper part
    translate([0, 20])
    {
      // bottom / ceiling
      square([25 + 2*wall, wall]);
      // top
      translate([0, wall])
      {
        square([wall, 20]);
        #translate([wall+25, 0])
          square([wall, 20]);
      }
    }
  }

  linear_extrude(h)
    side_2d();
}


holder();
