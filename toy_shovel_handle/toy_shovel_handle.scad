include <m3d/all.scad>

rounding = 4;

screw_d = 3;
screw_slot = screw_d + 0.5;
screw_n = 2;

rod_len  = 50;
rod_bore = 20;
rod_wall = 3;

width_h  = rod_bore + 2*rod_wall;
width_xy = 19;
span_int_w = 80;
span_int_l = 40;


module handle()
{
  module core()
  {
    module flat_profile()
    {
      module handle_profile()
      {
        module filled_in_handle_profile()
        {
          module base()
          {
            module rounded_square_ox(size)
            {
              d = size.y;
              span = size.x - 2*d/2;
              hull()
                for(dx=[-1,+1])
                  translate([dx*span/2, 0, 0])
                    circle(d=d);
            }

            ratio = 0.7;
            s1 = [ span_int_w + 2*width_xy,        width_xy];
            s2 = [(span_int_l + 2*width_xy)*ratio, width_xy];
            s3 = [s1.x/2, s1.y];
            // bottom
            translate([0, -s1.y/2])
              rounded_square_ox(s1);
            // sides
            for(dx=[-1,+1])
              translate([dx*(s1.x-s2.y)/2, 0])
                rotate([0, 0, 90])
                rounded_square_ox(s2);
            // top
            translate([0, s3.y/2 + span_int_l])
              rounded_square_ox(s3);
          }

          hull()
            base($fn=fn(50));
        }

        filled_in_handle_profile();
      }

      difference()
      {
        handle_profile();
        offset(r=-width_xy)
          handle_profile();
      }
      translate([-width_h/2, span_int_l + width_xy - 0.1])
        square([width_h, rod_len]);
    }

    minkowski()
    {
      translate([0, 0, rounding])
        linear_extrude(width_h - 2*rounding)
        offset(delta=-rounding)
        flat_profile();
      sphere(r=rounding, $fn=fn(30));
    }
  }

  module bore()
  {
    translate([0, span_int_l + width_xy - 0.1, 0])
      translate([0, 0, width_h/2])
      rotate([-90, 0, 0])
      cylinder(d=rod_bore, h=rod_len, $fn=fn(50));
  }

  module screw_slots()
  {
    h1 = 1.8;
    h2 = 20;
    dh = rounding;

    module screw_slot()
    {
      $fn=fn(30);
      translate([0, 0, -h2 - h1])
        cylinder(d=screw_slot, h=h2+h1);
      translate([0, 0, -h1])
        cylinder(d2=5.7, d1=screw_slot, h=h1);
      // extra len
      cylinder(d=5.7, h=dh);
    }

    edge_spacing = 10;
    for(i=[0:screw_n-1])
      translate([0, edge_spacing + i*((rod_len/screw_n)), 0])
        translate([0, span_int_l + width_xy + screw_d/2, 0])
        translate([0, 0, width_h])
        screw_slot();
  }

  render()
    difference()
    {
      core();
      bore();
      screw_slots();
    }
}


handle();
