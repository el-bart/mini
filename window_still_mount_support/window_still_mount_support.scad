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

wedge(width=100, span=21, height=4);
