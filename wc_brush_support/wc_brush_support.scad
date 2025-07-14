include <m3d/all.scad>

size = [60, 40, 3];
cut_d = 16;
round_r = 2;

h_cut = size.z + 2*eps;


module chamfer(dir)
{
  module corners()
  {
    render()
      translate(round_r*[0,1,0])
      difference()
      {
        translate(round_r*[-1,-1,0])
          cube(round_r*[2,2,0] + [0,0,h_cut]);
        cylinder(r=round_r, h=h_cut, $fn=fn(30));
      }
  }

  translate(-dir*[cut_d/2+round_r, 0, 0])
    intersection()
    {
      corners();
      translate([ dir > 0 ? 0 : -round_r, 0, 0])
        cube([round_r, round_r, h_cut]);
    }
}


module main()
{
  difference()
  {
    translate([-size.x/2, 0, 0])
      side_rounded_cube(size, round_r, $fn=fn(30));

    translate([0,0,-eps])
    {
      // main cut
      union()
      {
        translate([0, size.y/2, 0])
          cylinder(d=cut_d, h=h_cut, $fn=fn(50));
        translate([-cut_d/2, -eps, 0])
          cube([cut_d, size.y/2 + eps, h_cut]);
      }
      // chamfers
      chamfer(-1);
      chamfer(+1);
    }
  }
}


main();
