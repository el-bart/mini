module wedge(width, span, height)
{
  polyhedron(
    points=[
             [0, 0, 0],
             [span, 0, 0],
             [span, width, 0],
             [0, width, 0],
             [0, width, height],
             [span, width, height],
           ],
    faces=[
            // bottom
            [0,1,2],
            [2,3,0],
            // sides
            [5,2,1],
            [0,3,4],
            // back
            [3,2,4],
            [5,4,2],
            // top
            [0,4,5],
            [5,1,0],
          ]
   );
};

module support()
{
  h=4.5;

  difference()
  {
    union()
    {
      wedge(width=110, span=21, height=h);

      // rounded ending
      translate([21/2,110,0])
        difference()
        {
          cylinder(r=21/2, h=h);
          translate([-21/2, -21/2*2, 0])
            cube([21,21,h]);
        }
    }

    // screw hole
    translate([21/2, 110-8/2, 0])
      cylinder(r=8/2, h=h);
  }
}

support();

translate([-5, 0, 0])
  rotate([0, -90, 0])
    support();