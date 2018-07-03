difference()
{
  // main screw mount - top part
  {
    int_cube_size=9.5;
    translate([-int_cube_size/2, -int_cube_size/2, 0])
      cube([int_cube_size, int_cube_size, 3]);
  }
  // screw hole
  screw_box_size=7+0.5;
  translate([-screw_box_size/2, -screw_box_size/2, 0.5])
    cube([screw_box_size, screw_box_size, 3-0.5]);
  cylinder(r=4/2, h=12, $fs=1);
}
