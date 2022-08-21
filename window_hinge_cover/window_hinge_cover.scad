eps = 0.01;
wall = 0.65;
length = 59;
width = 21.6;
cut_in_length = 15;
extra_walls = 1.5;


module element()
{
  module profile_shell_int()
  {
    module exterior()
    {
      module profile()
      {
        r=7;
        hull()
        {
          translate(r*[1,1,0] + [0,4,0])
            circle(r=r, $fn=50);
          square([width, 6]);
        }
      }
      intersection()
      {
        minkowski()
        {
          difference()
          {
            translate(-5*[1,1,0])
              square([30,30]);
            profile();
          }
          circle(r=wall, $fn=50);
        }
        profile();
      }
    }
    difference()
    {
      exterior();
      translate(wall*[1,0] - eps*[0,1])
        square([width-2*wall, wall+2*eps]);
    }
  }

  module profile_shell()
  {
    intersection()
    {
      // additional wall thickness
      union()
      {
        difference()
        {
          minkowski()
          {
            profile_shell_int();
            circle(r=wall*extra_walls, $fn=50);
          }
          #hull()
            profile_shell_int();
        }
        profile_shell_int();
      }
      // remove bottom overhang
      translate(-10*[1,0])
        square(100*[1,1]);
    }
  }

  module surround()
  {
    linear_extrude(length)
      profile_shell();
  }
  module side()
  {
    linear_extrude(wall*(1+extra_walls))
      hull()
        profile_shell();
  }

  module core()
  {
    surround();
    for(dz=[-extra_walls*wall, length-wall])
      translate([0,0,dz])
        side();
  }

  rotate([90, 0, 0])
    difference()
    {
      core();
      translate(length/2*[0,0,1] - [6,0,0])
        translate(-cut_in_length/2*[0,0,1])
          cube([width, 30, cut_in_length]);
    }
}


element();
