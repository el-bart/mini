wall = 1.5;

module cover()
{
  module corner()
  {
    cube([3,3,5]);
  }

  cube([46, 35.5, 1]);
  translate((wall+0.5)*[1,1,0] + [0, 0, 1])
    corner();
  translate([46, 35.5, 1] - (3+wall+0.5)*[1,1,0])
    corner();
}

cover();
