use <closet_hinge.scad>

module cover_shape()
{
  h1=5;
  polyhedron(
    points = [
               [55,  0,  0], // 0
               [55,  0, h1], // 1
               [55, 45, h1], // 2
               [55, 45,  0], // 3
               [ 0, 45, h1], // 4
               [ 0, 45,  0], // 5
               [ 0,  0,  0], // 6
               [ 0,  0, h1], // 7
               [55/2,0, 30], // 8
               [55/2,40,30]  // 9
             ], 
    faces = [
               [0,1,2],
               [0,2,3],
               [5,2,4],
               [2,5,3],
               [7,6,4],
               [5,4,6],
               [4,8,7],
               [9,8,4],
               [4,2,9],
               [1,8,9],
               [1,9,2],
            ]
  );
}

module cover()
{
  extra_size = 2;
  difference()
  {
    minkowski()
    {
      cube(extra_size*[1,1,1]);
      cover_shape();
    }
    // cut for the regulation screw
   translate([21, 25, 0])
      cube([15, 15, 50]);
  }
}

%translate([18, 0, 0])
  closet_hinge();
cover();