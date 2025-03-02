include <m3d/all.scad>

wall = 2;


module transmitter_box()
{
  int_size = [28, 30, 10];
  ext_size = int_size + wall*[2,2,1];

  module main_box()
  {
    difference()
    {
      side_rounded_cube(ext_size, wall, $fn=fn(50));
      translate(wall*[1,1,1])
        cube(int_size + [0,0,eps]);
    }
  }

  module laser_holder()
  {
    spacing = 0.5;
    d_ext = 12 + spacing;
    d_int = 10 + spacing;
    s = [d_ext+2*wall/2, ext_size.y, wall+d_ext/2];
    mor_len = 3.4 + spacing;    // mid-outer-ring lenght
    mor_in = 7.3;               // mid-outer-ring distance from lens' edge
    off = [ext_size.x - d_ext-2*wall, 0, 0];
    difference()
    {
      union()
      {
        translate(off)
          cube(s);
        children();
      }
      translate(off)
      {
        // main laster cut
        translate([s.x/2, ext_size.y-wall, s.z])
          rotate([90, 0, 0])
            cylinder(d=d_int, h=ext_size.y-wall+eps, $fn=fn(50));
        // mid-outer ring cut
        translate([s.x/2, mor_len+mor_in, s.z])
          rotate([90, 0, 0])
            cylinder(d=d_ext, h=mor_len, $fn=fn(50));
        // removal of the rest of the front wall
        translate([wall, -eps, wall+d_ext/2])
          cube([d_int, wall+2*eps, s.z]);
      }
    }
  }

  laser_holder()
    main_box();
}


module receiver_box()
{
  solder_space = 2.4; // max space for THT elements on the bottom
  pcb_xy_spacing = 1.4;
  pcb_size = [42.5, 27.5, 1.65];
  int_size = pcb_size + [0,0,solder_space] + pcb_xy_spacing*[2,2,0];
  ext_size = int_size + wall*[2,2,1];
  
  difference()
  {
    side_rounded_cube(ext_size, wall, $fn=fn(50));
    translate(wall*[1,1,1])
      cube(int_size + [0,0,eps]);
  }
}


//receiver_box();

transmitter_box();
