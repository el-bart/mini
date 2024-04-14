use <m3d/fn.scad>
include <m3d/math.scad>
include <detail/config.scad>
use <fh3dp_bar.scad>


module holder()
{
  module column()
  {
    module side()
    {
      s = [arm_cross_len, wall, arm_h];
      translate(-1/2*[s.x, s.y, 0] + [0, 0, wall])
        cube(s);
    }
    module core()
    {
      side();
      rotate([0, 0, 90])
        side();
    }
    module bar_hold_2d_inner()
    {
      d = bar_d+2*bar_spacing;
      circle(d=d);
      translate([-d/2, 0])
        square([d, d]);
    }
    module bar_hold_2d_outer()
    {
      intersection()
      {
        offset(r=wall)
          bar_hold_2d_inner();
        square(2*(bar_d+2*bar_spacing-eps)*[1,1], center=true);
      }
    }
    module bar_hold_pos(delta)
    {
      translate([-arm_cross_len/2 - delta, 0, arm_h])
        rotate([0, 90, 0])
          rotate([0, 0, 90])
            linear_extrude(arm_cross_len + 2*delta)
              children();
    }

    difference()
    {
      union()
      {
        bar_hold_pos(0)
          bar_hold_2d_outer($fn=fn(50));
        core();
      }
      bar_hold_pos(eps)
        bar_hold_2d_inner($fn=fn(50));
    }
  }

  module weight_slot()
  {
    s = [base_size.x, 2*wall+weight_d, weight_d];
    si = s - 2*wall*[1,1,0];
    translate(-1/2*[s.x, s.y, 0])
      difference()
      {
        cube(s);
        translate(wall*[1,1,0])
        {
          translate([0, 0, s.z/2])
            cube(si);
          translate([0, weight_d/2, s.z/2+wall])
            rotate([0, 90, 0])
              cylinder(d=weight_d, h=si.x, $fn=fn(30));
        }
      }
  }

  module base()
  {
    translate(-1/2*[base_size.x, base_size.y, 0])
      cube(base_size);
  }

  base();

  for(dx=[-1, +1])
    translate([dx*(base_size.x/2 - arm_cross_len/2), 0, 0])
      column();

  for(dy=[-1,+1])
    translate([0, dy*(base_size.y/2), 0])
      weight_slot();
}


holder();
%if(1)
  translate([-(base_size.x + 2*bar_side_h)/2, 0, arm_h])
    rotate([0, 90, 0])
      bar();
