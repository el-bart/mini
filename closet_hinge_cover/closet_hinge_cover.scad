use <closet_hinge.scad>

module shell(extra_size)
{
  cube_size=100;

  difference()
  {
    resize([60, 60, 70] + extra_size*[1,1,1])
      sphere(r=25);
    // front cut
    translate(cube_size*[-1/2, -1, -1/2] + [0, -20, 0])
      cube(cube_size*[1,1,1]);
    // bottom cut
    translate(cube_size*[-1/2, -1/2, -1])
      cube(cube_size*[1,1,1]);
  }
}


module cover()
{
  difference()
  {
    shell(3);
    shell(0);
  }
}


%translate([-21/2, -41/2, 0])
  closet_hinge();
cover();