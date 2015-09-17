polyhedron(
    points = [
               [ 0,  0,  0], // 0
               [ 0, 60,  0], // 1
               [30, 60,  0], // 2
               [30,  0,  0], // 3
               [30,  0, 20], // 4
               [ 0,  0, 20]  // 5
             ],
    faces = [
              // side walls
              [0,1,5],
              [2,3,4],
              // floor
              [2,1,0],
              [3,2,0],
              //back wall
              [4,3,0],
              [5,4,0],
              // front wall
              [1,2,5],
              [2,4,5]
            ]
);
