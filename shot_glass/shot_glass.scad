use <m3d/fn.scad>

// wall in [mm]
// base diameter in [mm]
// angle in [deg]
// volume in [ml]
module glass(wall, base, angle, volume)
{
  w = wall;
  b = base;
  a = angle;
  v_g = volume * 1000; // 1[ml] = 1000 [mm^3]
  pi = 3.1415926536;

  hh = b / (2 * tan(a));
  v_hh = pi * pow(b,3) / (24 * tan(a));
//  echo("haight of the 'invisible' part: ", hh);
//  echo("volume of the 'invisible' part: ", v_hh);
  v = v_g + v_hh;
  H = pow(3*v / (pi * pow(tan(a), 2)), 1/3);
//  echo("whole cone volume: ", v);
//  echo("full cone height: ", H);
  h = H - hh;
  echo("haight: ", h);
  x = h * tan(a);
  r = b/2 + x;
  echo("top diameter: ", 2*r);
  
  module interior()
  {
    polygon([
      [0, 0],
      [0, h],
      [r, h],
      [b/2, 0]
    ]);
  }
  
  module exterior()
  {
    offset(delta=w, $fn=fn(40))
      interior();
  }
  
  module core()
  {
    intersection()
    {
      difference()
      {
        exterior();
        interior();
      }
      // skip center and top parts
      translate([0, -wall])
        square([r+wall, h+wall]);
    }
  }

  rotate_extrude($fn=fn(100))
    core();
}


glass(wall=2*0.6/*mm*/, base=20/*mm*/, angle=10/*deg*/, volume=25/*ml*/);
