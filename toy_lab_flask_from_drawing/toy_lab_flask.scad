size_2d = [170, 280];
wall = 0.9;

module main_2d()
{
  module base_2d()
  {
    translate([-size_2d.x/2, 0])
      resize(size_2d)
      import("model.svg");
  }

  module base_int_2d()
  {
    offset(delta=-wall)
      base_2d();
  }

  intersection()
  {
    difference()
    {
      base_2d();
      base_int_2d();
    }
    square([size_2d.x, size_2d.y - wall - 1]);
  }
}

rotate_extrude(angle=360, $fn=40)
  main_2d();
