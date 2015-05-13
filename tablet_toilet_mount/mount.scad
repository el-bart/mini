module mount()
{
  polyhedron(
    points = [
               [ 0,  0,  0], // 0
               [ 0,  7,  0], // 1
               [20,  7,  0], // 2
               [20,  0,  0], // 3
               [20,  0, 45], // 4
               [ 0,  0, 45]  // 5
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
}


rotate([90, 0, 0])
{
  mount();
  cube([20, 33+5+2, 3]);
  translate([0, 33+5, 0])
    cube([20, 2, 10]);
}
