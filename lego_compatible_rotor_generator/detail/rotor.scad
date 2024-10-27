use <../m3d/fn.scad>
include <../m3d/math.scad>

module lego_mount(length)
{
  leg_hole_spacing = 3.15 + 2*4.80/2;

  module lego_axle(length, spacing=0)
  {
    y = 1.80 + 2*spacing;
    x = 4.75 + 2*spacing;
    translate([0, 0, -length/2])
      linear_extrude(length)
        for(dr=[0, 90])
          rotate([0, 0, dr])
            square([x, y], center=true);
  }

  module lego_axle_slot(length)
  {
    lego_axle(length=length, spacing=0.3);
  }

  module lego_round_slot(length)
  {
    cylinder(d=4.80, h=length, $fn=fn(50), center=true);
  }

  lego_axle_slot(length);
  if(0) // TODO: likley not needed
    for(dx=[-1,+1])
      translate([dx*leg_hole_spacing, 0, 0])
        lego_round_slot(length);
}


module rotor(mount_d,
             mount_h=-1,
             pitch_start,
             pitch_end,
             blades,
             blade_chord,
             blade_len,
             bottom_supports)
{
  profile_d = 1;
  mount_h = mount_h == -1 ? blade_chord + 2*profile_d : mount_h;
  blade_len_fwd = blade_len - blade_chord/2 - profile_d/2; // leave space for for end rounding

  module mount_base()
  {
    cylinder(d=mount_d, h=mount_h, $fn=fn(50), center=true);
  }

  module blade()
  {
    module profile()
    {
      hull()
        for(dx=[-1,+1])
          translate([dx*blade_chord/2, 0, 0])
            circle(d=profile_d, $fn=fn(10));
    }

    rotate([0, 0, -pitch_start])
      linear_extrude(height=blade_len_fwd, twist=pitch_end-pitch_start, $fn=fn(300))
        profile();
    // rounding at the top
    translate([0, 0, blade_len_fwd])
      rotate([0, 0, -pitch_end])
        rotate([90, 0, 0])
          intersection()
          {
            d = blade_chord+profile_d;
            cylinder(d=d, h=profile_d, center=true, $fn=fn(50));
            translate(d/2*[0, 1, 0])
              cube(d*[1,1,1], center=true);
          }
  }

  module core()
  {
    mount_base();
    for(dr = [0 : 360/(blades) : 360])
      rotate([0, 0, dr])
        rotate([0, 90, 0])
          blade();
  }

  intersection()
  {
    difference()
    {
      core();
      lego_mount(mount_h+2*eps);
    }
    // make it printable w/o supports
    cylinder(d=3*blade_len, h=mount_h, center=true);
  }

  if(bottom_supports)
  {
  }
}



rotor(mount_d = 14,
      mount_h = 13,
      pitch_start = 45,
      pitch_end = 45,
      blades = 3,
      blade_chord = 20,
      blade_len = 30,
      bottom_supports=false);
