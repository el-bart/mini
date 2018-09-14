use <controller.scad>
use <screw.scad>

module side_bruse_impl()
{
  for(sig = [-1, +1])
    for(i = [1, 2, 3])
      translate([0, i*18, -1])
        rotate([sig*20, 0, 0])
          cube([3, 2, 26]);
}

module junction_box_impl()
{
  wall = 2;
  extra_depth = 5;
  int_size = [70, 70, 24+3+extra_depth];

  difference()
  {
    // main box
    cube(int_size + [2,2,1]*wall);
    translate([1,1,1]*wall)
      cube(int_size);
    // place for cables
    cable_cut_in = [20, 10, wall];
    translate([(int_size[0]+2*wall-cable_cut_in[0])/2, wall, 0])
      cube(cable_cut_in);
  }

  // screw holes
  dist_from_center = 59/2;
  for(dx = [-1, +1])
  {
    translate([(int_size[0]+2*wall)/2+dx*dist_from_center,
               wall+int_size[1]/2,
               wall])
    {
      difference()
      {
        // main screw corridor
        union()
        {
          cylinder(r=10/2, h=int_size[2]-2);
          translate([12/2/2*(dx-1), -10/2, 0])
            cube([12/2, 10, int_size[2]-2]);
        }
        cylinder(r=(3+1)/2, h=int_size[2]-2, $fs=1);
        // nut cut-in
        translate([0, 0, int_size[2]-2-13])
          scale(1.1)
            hull()
            {
              screw();
              translate([0, 9, 0])
                screw();
              translate([0, 9, 7])
                screw();
            }
      }
    }
  }

  // side bruses for better mounting - left/right
  for(dx = [-3, int_size[0]+2*wall])
    translate([dx, 0, 0])
      side_bruse_impl();
  // side bruses for better mounting - up/down
  for(dy = [-3, int_size[0]+2*wall])
    translate([75, dy, 0])
      rotate([0, 0, 90])
        side_bruse_impl();
}

module junction_box()
{
  difference()
  {
    junction_box_impl();
    translate([-10, -10, -5])
      cube([100,100,5]);
  }
}

if(false)
  translate([-7, -6, 10*2])
    controller();

junction_box();
