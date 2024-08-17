use <m3d/fn.scad>

module rotor(blades, pitch_start, pitch_end, blade_chord, blade_len)
{
  module blade()
  {
    module profile()
    {
      hull()
        for(dx=[-1,+1])
          translate([dx*blade_chord/2, 0, 0])
            circle(d=1, $fn=fn(10));
    }

    rotate([0, 0, -pitch_start])
      linear_extrude(height=blade_len, twist=pitch_end-pitch_start, $fn=fn(500))
        profile();
  }

  blade();
}

rotor(blades=3,
      pitch_start=20,
      pitch_end=45,
      blade_chord=10,
      blade_len=40);
