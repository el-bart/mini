// closing nails' parameters
nail_thickness = 1;
nail_head      = 3.5;
nail_span      = 43;
nail_outstand  = 3;


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
              [2,1,0],
              [0,3,2],
              // upper wall
              [1,2,5],
              [6,5,2],
              // lower wall
              [4,3,0],
              [3,4,7],
              // left wall
              [0,1,4],
              [5,4,1],
              // right wall
              [2,3,7],
              [7,6,2]
            ]
  );
}


spacing = 2;
top     = 1.5*nail_thickness;
bottom  = 2*nail_head;
cut_h   = (nail_head - nail_thickness)*8;
h       = cut_h + 2*spacing;
l       = nail_span + bottom/2*2 + 2*spacing;
thick   = nail_outstand/2;

difference()
{
  cube([l, h, thick]);
  for(dx = [spacing, l-spacing-bottom])
    translate([dx, (h-cut_h)/2, 0])
      cut(thick, cut_h, top, bottom);
}