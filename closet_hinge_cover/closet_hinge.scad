

module closet_hinge()
{
  // lower cross
  cube([21, 41, 4]);
  translate([-51/2 + 21/2, 41-18-10])
    cube([51, 18, 4]);
  // hinge upper part
  translate([(21-16)/2, 0, 4])
  {
    polyhedron(
      points = [
               [ 0,  0,  0], // 0
               [16,  0,  0], // 1
               [ 0,  0, 16], // 2
               [16,  0, 16], // 3
               [ 0, 41,  0], // 4
               [16, 41,  0], // 5
               [ 0, 41, 10], // 6
               [16, 41, 10]  // 7
             ], 
      faces = [
               [0,2,1],
               [1,2,3],
               [1,3,7],
               [7,5,1],
               [6,2,0],
               [0,4,6],
               [4,5,6],
               [7,6,5],
               [6,3,2],
               [3,6,7],
               [0,1,4],
               [5,4,1]
            ]
    );
  }
  // side mounting screws
  translate([0, 41-10-18/2, 0])
  {
    for(offsetOX = [-15/2, 21+15/2])
      translate([offsetOX, 0, 0])
        cylinder(r=7/2, h=6, $fs=2);
  }
  // main positioning screw
  translate([21/2, 41-3-7/2, 0])
    cylinder(r=7/2, h=18, $fs=2);
}

closet_hinge();