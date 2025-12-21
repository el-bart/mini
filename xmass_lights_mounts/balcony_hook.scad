include <m3d/all.scad>
include <detail/config.scad>

module balcony_hook(
    span_int=62.5, // measured: 57-62
    side_in=60,
    side_out=35,
    hook_side=15)
{
  $fn = fn(40);

  module profile()
  {
    module base()
    {
      dy_far = wall + span_int + wall/2;
      dy_near = wall/2;

      // left bar
      translate([-wall-span_int-wall/2, 0])
      hull()
      {
        circle(d=wall);
        translate([0, -side_in])
          circle(d=wall);
      }
      // horizontal bar
      hull()
      {
        translate([-wall-span_int-wall/2, 0])
          circle(d=wall);
        translate([-wall/2, 0])
          circle(d=wall);
      }
      // right bar
      translate([-wall/2, 0])
        hull()
        {
          circle(d=wall);
          translate([0, -side_out])
            circle(d=wall);
        }
    }

    module hook()
    {
      // lower bar
      translate([-wall/2, -side_out])
        hull()
        {
          circle(d=wall);
          translate([hook_side, 0])
            circle(d=wall);
        }
      // vertical bar
      translate([-wall/2 + hook_side, -side_out])
        hull()
        {
          circle(d=wall);
          translate([0, hook_side])
            circle(d=wall);
        }
      // top bar
      translate([-wall/2, -side_out + hook_side])
        hull()
        {
          translate([wall+cable_hole_dist, 0])
            circle(d=wall);
          translate([hook_side, 0])
            circle(d=wall);
        }
    }

    base();
    hook();
  }

  linear_extrude(height)
    profile();
}


balcony_hook();
