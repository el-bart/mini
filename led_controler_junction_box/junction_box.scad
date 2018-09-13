use <controller.scad>

module junction_box()
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
    #translate([(int_size[0]+2*wall-cable_cut_in[0])/2, wall, 0])
      cube(cable_cut_in);
  }

  // screw drivers
  dist_from_center = 59/2;
  translate([-20, 0, 0])                                    
  for(dx = [-dist_from_center, +dist_from_center])
  {
    translate([(int_size[0]+2*wall)/2+dx, wall+30, wall])
      difference()
      {
        cylinder(r=9/2, h=int_size[2]-2);
        cylinder(r=(3+1)/2, h=int_size[2]-2, $fs=1);
        #hull()
        {
          cube([9, 6, 3]);
        }
      }
    
  }
}

if(false)
  translate([-7, -6, 10*2])
    controller();

junction_box();
