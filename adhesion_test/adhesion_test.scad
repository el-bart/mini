module adhesion_test()
{
  size = [50, 50, 20];
  wall = 2;
  base = 0.4;
  difference()
  {
    cube(size);
    translate([wall, wall, base])
      cube(size - wall*[2,2,0]);
  }
}


adhesion_test();
