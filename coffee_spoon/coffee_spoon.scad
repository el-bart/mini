vol = 11700;                // Volumen of the final construct
b   = 30;                   // Base
w   = 30;                   // Width
h   = ceil( 2*vol/(b*w) );  // Height
t   = 1.5;                  // wall Thickness

echo(h=h);

module shape(b, w, h)
{
  polyhedron(points = [
                        [0,   0, 0], // 0
                        [b,   0, 0], // 1
                        [b,   w, 0], // 2
                        [0,   w, 0], // 3
                        [b/2, 0, h], // 4
                        [b/2, w, h]  // 5
                      ],
             faces = [
                        [1,0,4],
                        [3,2,5],
                        [0,1,3],
                        [1,2,3],
                        [1,4,5],
                        [5,2,1],
                        [0,3,5],
                        [0,5,4]
                     ]
            );
}

module spoon()
{
  difference()
  {
    translate([-t, -t, 0])
      shape(b+2*t, w+2*t, h+1*t);
    shape(b, w, h);
  }
}


translate([-w/2, 0, 0])
  rotate([0, 0, -90])
    spoon();

translate([-15/2, 0, 0])
  cube([15, 120, 3]);
