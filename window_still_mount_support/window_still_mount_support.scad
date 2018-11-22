w=119;
s=21;
h=2.5;


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


module fence(width, height)
{
  cube([width, 119, height-h]);
  translate([0,0,1])
    wedge(width=w, span=1, height=h);
}


module support()
{
  translate([1,0,0])
  {
    difference()
    {
      union()
      {
        wedge(width=w, span=s, height=h);

        // rounded ending
        translate([s/2, w, 0])
          difference()
          {
            cylinder(r=s/2, h=h);
            translate([-s/2, -s/2*2, 0])
              cube([s, s, h]);
          }
      }

      // screw hole
      translate([s/2, w-8/2, 0])
        cylinder(r=8/2, h=h);
    }
  }

  // side walls
  for(i=[0, s+1])
    translate(i*[1,0,0])
      fence(width=1, height=h+1);
}

for(i=[0:0])
  translate(i*[25, 0, 0])
    support(2.5);
