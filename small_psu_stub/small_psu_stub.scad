use <m3d/rounded_cube.scad>

wall = 2*0.4;
box_size = [60, 25, 20];
roundings = 2;

module box_main()
{
  difference()
  {
    
    rounded_cube(box_size, roundings, $fn=30);
    translate(wall*[1,1,1])
      rounded_cube(box_size - 2*wall*[1,1,1], roundings-wall, $fn=30);
  }
}

intersection()
{
  box_main();
  cube([30, 30, 30]);
}
