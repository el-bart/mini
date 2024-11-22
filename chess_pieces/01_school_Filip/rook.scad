use <m3d/fn.scad>
include <m3d/math.scad>

module rook()
{
  rotate_extrude(angle=360, $fn=fn(80))
    import("model/rook-Sketch.svg");
}


rook();
