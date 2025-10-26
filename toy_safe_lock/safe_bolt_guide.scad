include <m3d/all.scad>
include <detail/config.scad>

module safe_bolt_guide()
{
  bolt_profile = [bolt_d, bolt_h] + bolt_guide_spacing*[2,2];
  s = bolt_profile + bolt_wall*[2,1];
  bs = [2*bolt_guide_h + s.x, bolt_wall];

  module profile()
  {
    // guide
    translate([-s.x/2, 0])
      difference()
      {
        union()
        {
          square(s);
          // base
          translate([-bolt_guide_h, 0])
            square(bs);
        }
        translate(bolt_wall*[1,0])
          square(bolt_profile);
      }
  }

  difference()
  {
    linear_extrude(bolt_guide_h)
      profile();
    // screw holes
    for(dx=[-1,+1])
      translate([dx*(bs.x/2 - bolt_guide_h/2), 0, bolt_guide_h/2])
        rotate([-90, 0, 0])
        cylinder(d=bolt_guide_screw_d, h=bolt_guide_h+2*eps, $fn=fn(50));
  }
}


safe_bolt_guide();
