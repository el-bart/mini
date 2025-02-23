module controller()
{
  difference()
  {
    // body
    union()
    {
      difference()
      {
        union()
        {
          translate([0,0,24])
            cube([88, 86, 13]);
          translate([15, 10, 0])
            cube([59, 66, 24]);
        }
        translate([15+2, 10, 0])
          cube([55, 16, 25]);
      }
      // power cord mounts
      translate([(88-20)/2, 10+2, 24-10])
        cube([20, 8, 10]);
      // screw hole frame
      for(dx = [15, 88-15])
        translate([dx, 43, 24-3])
          hull()
          {
            for(dy = [0, 13-10.5])
              translate([0, dy, 0])
                cylinder(r=10.5/2, h=3);
          }
    }

    // screw mounts
    for(dx = [15, 88-15])
      translate([dx, 43, 0])
        hull()
        {
          for(dy = [0, 13-10.5])
            translate([0, dy, 0])
              cylinder(r=10.5/2, h=24-3);
        }

    // screw holes
    for(dx = [15, 88-15+3/2/2])
      translate([dx, 43, 24-3])
        hull()
        {
          for(dy = [0, 13-10.5])
            translate([0, dy, 0])
              cylinder(r=3/2, h=3, $fs=0.01);
        }
  }
}

%controller();
