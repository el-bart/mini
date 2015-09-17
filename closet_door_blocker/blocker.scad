module cut(height, length, span_up, span_down)
{
  up_offset = (span_down-span_up)/2;
  polyhedron(
    points = [
               [ 0,                 0,       0],      // 0
               [ up_offset,         length,  0],      // 1
               [ up_offset+span_up, length,  0],      // 2
               [ span_down,         0,       0],      // 3
               [ 0,                 0,       height], // 4
               [ up_offset,         length,  height], // 5
               [ up_offset+span_up, length,  height], // 6
               [ span_down,         0,       height]  // 7
             ],
    faces = [
              // bottom
              [4,5,7],
              [5,6,7],
              // top
              [0,1,2],
              [2,3,0],
              // upper wall
              [1,2,5],
              [2,5,6],
              // lower wall
              [0,3,4],
              [3,4,7],
              // left wall
              [0,1,4],
              [1,4,5],
              // right wall
              [2,3,7],
              [2,6,7]
            ]
);

}


cut(2, 20, 2, 15);