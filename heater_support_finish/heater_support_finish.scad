spacing = 1.5;
intX = 30 + 2*spacing;
intY = 30 + 2*spacing;

extX = 15 + intX + 15;
extY = 15 + intY + 20;

h = 15;


module support()
{
  polyhedron(
    points = [
               [0,    0,    0],
               [extX, 0,    0],
               [extX, extY, 0],
               [0,    extY, 0],
  
               [15,      15,      0],
               [15+intX, 15,      0],
               [15+intX, 15+intY, 0],
               [15,      15+intY, 0],
  
               [15,      15,      h],
               [15+intX, 15,      h],
               [15+intX, 15+intY, h],
               [15,      15+intY, h]
             ],

    faces = [
              // base
              [0, 4, 7],
              [0, 7, 3],
              [4, 0, 1],
              [5, 4, 1],
              [5, 1, 6],
              [6, 1, 2],
              [6, 2, 7],
              [7, 2, 3],

              // side walls
              [8,  0,  3],
              [3, 11,  8],
              [3,  2, 11],
              [2, 10, 11],
              [2,  9, 10],
              [2,  1,  9],
              [1,  0,  8],
              [9,  1,  8],

              // internal walls
              [7,  4, 11],
              [4,  8, 11],
              [6,  7, 11],
              [10, 6, 11],
              [5,  6, 10],
              [9,  5, 10],
              [4,  5,  8],
              [8,  5,  9]
            ]
  );
}

// part 1
difference()
{
  support();
  translate([0, extY-20, 0])
    cube([70, 20, 15]);
}


// part 2
translate([0, 10, 0])
  difference()
  {
    support();
    translate([0, 0, 0])
      cube([70, extY-20, 15]);
  }
