use <m3d/fn.scad>
use <mocks/filament_cooler_fan.scad>

eps = 0.01;

module pos_filament_cooling_duct()
{
  translate([0, -20, 5.2])
    rotate([0, 90, -90])
      children();
}

module duct_pos_filament_cooler_fan()
{
  translate([5.15, 0, -20])
    rotate([-90, 0, 0])
      rotate([0, -90, 0])
        children();
}


module duct_interal(angle, length, rot_r)
{
  size_in  = [8, 28];
  size_out = [3, 15];
  rot_off = [-rot_r, 0];

  module curved_connector()
  {
    rotate([-90, 0, 0])
      translate(-rot_off)
        rotate_extrude(angle=angle, $fn=fn(100))
          translate(rot_off)
            translate(-0.5*size_in)
              square(size_in);
  }

  module funnel()
  {
    module core()
    {
      hull()
      {
        // end
        translate(length*[0,0,1])
          linear_extrude(eps)
            #translate([-0.5*size_in.x, -size_out.y/2 + (size_in.y-size_out.y)/2])
              square(size_out);
        // start
        linear_extrude(eps)
          translate(-0.5*size_in)
            square(size_in);
      }
    }

    translate(-rot_off)
      rotate([0, angle, 0])
        translate(rot_off)
          core();
  }

  curved_connector();
  funnel();
}

module duct()
{
  angle = 55;
  length = 24;
  wall = 2.0;
  rot_r = 5;
  max_h = 27-4;

  module exterior()
  {
    module surrounding()
    {
      minkowski()
      {
        duct_interal(angle=angle, length=length, rot_r=rot_r);
        cube(wall*[1,1,1], center=true);
        // sphere(r=wall, $fn=fn(20));
      }
    }

    intersection()
    {
      // body
      surrounding();
      x = 100;
      // remove input closing
      {
        translate(-0.5*[x,x,0])
          cube([x, x, x]);
      }
      // remove output closing
      {
        extra = 100;
        rot_off = [-rot_r, 0];
        translate(-rot_off)
          rotate([0, angle, 0])
            translate(rot_off)
              translate(-0.5*[x,x,0])
                translate([0, 0, -extra])
                  cube([x, x, length+extra]);
      }
    }
  }

  module core()
  {
    difference()
    {
      exterior();
      duct_interal(angle=angle, length=length, rot_r=rot_r);
    }
  }

  // ensure core duct part does not exceed maximum allowed h (aka: print clearance)
  intersection()
  {
    core();
    cube([100, 100, 2*max_h], center=true);
  }
}


module oy_centered_cube(size)
{
  translate([0, -size.y/2, 0])
    cube(size);
}


module filament_cooling_duct()
{
  module base()
  {
    h = 6;      // non-overlapping height
    oh = 6.5;   // overlap height
    wall = 2;
    oy_centered_cube([wall, 30, oh]);
    translate([-wall, 0, -h])
      oy_centered_cube([wall, 40, h+oh]);
    translate([-wall, -20, -40])
      cube([wall, 10, 40]);
  }

  module base_with_screw_holes()
  {
    difference()
    {
      translate([-5, 0, 0])
        base();
      duct_pos_filament_cooler_fan()
        filament_cooler_fan_screw_holes()
          cylinder(d=3+0.5, h=20, $fn=fn(50));
    }
  }

  base_with_screw_holes();
  duct();
}


rotate([0, -90, 0])
{
  filament_cooling_duct();

  %if($preview)
    duct_pos_filament_cooler_fan()
      filament_cooler_fan();
}
