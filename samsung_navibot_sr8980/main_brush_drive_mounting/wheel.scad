difference()
{
  union()
  {
    // main cylinder
    difference()
    {
      cylinder(r=24.5/2, h=2.5);
      cylinder(r=16/2, h=1.5);
    }
    
    // 3 side blockers
    for(angle = [0, 120, 240])
      rotate([0, 0, angle])
        translate([-1/2, -1/2, 0] + [16/2-1/2, 0, 0])
          cube([1.5, 1, 2]);
    
    // main screw mount - bottom part
    intersection()
    {
      int_cube_size=7.2;
      rotate([0, 0, 0])
        translate([-int_cube_size/2, -int_cube_size/2, 0])
          cube([int_cube_size, int_cube_size, 2]);
      rotate([0, 0, 45])
        translate([-int_cube_size/2, -int_cube_size/2, 0])
          cube([int_cube_size, int_cube_size, 2]);
    }
    
    // main screw mount - top part
    {
      int_cube_size=9.5;
      translate([-int_cube_size/2, -int_cube_size/2, 0] + [0, 0, 2.5])
        cube([int_cube_size, int_cube_size, 7]);
    }
  }
  // screw hole
  screw_box_size=7+0.5;
  translate([-screw_box_size/2, -screw_box_size/2, 2.5+1])
    cube([screw_box_size, screw_box_size, 7-1]);
  cylinder(r=4/2, h=12, $fs=1);
}
