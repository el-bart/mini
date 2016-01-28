sh=15;      // support height
l =210;     // construction length
ft=3.5;     // floor thickness

pts = [
        [0, 30+5,  0],   // 0
        [l, 10+5,  0],   // 1
        [l,  -40,  0],   // 2
        [0,  -35,  0],   // 3
        [0, 30+5, ft],   // 4
        [l, 10+5, ft],   // 5
        [l,  -40, ft],   // 6
        [0,  -35, ft],   // 7
      ];

module leftWall()
{
  // internal support
  cube([l, 5, sh]);
  translate([(l-5)/2, -25, 0])
    cube([5, 25, sh]);
  // ground floor
  polyhedron(
    points = pts,
    faces = [
              // bottom surface:
              [0, 2, 1],
              [0, 3, 2],
              // top surface:
              [4, 5, 6],
              [4, 6, 7],
              // left wall:
              [0,7,3],
              [0,4,7],
              // right wall:
              [1,2,6],
              [1,6,5],
              // top wall:
              [0,1,5],
              [0,5,4],
              // bottom wall:
              [3,6,2],
              [3,7,6],
            ]
  );
  // main wall
  // TODO...
}

leftWall();
