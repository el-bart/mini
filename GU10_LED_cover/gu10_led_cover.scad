use <m3d/fn.scad>

module cover()
{
  wall = 1.5;
  front_wall = 1;
  h = 4.5;
  d_int = 50;
  spacing = 0.3;

  $fn=fn(80);

  difference()
  {
    di = d_int + 2*spacing;
    de = di + 2*wall;
    cylinder(d=de, h=h);
    translate([0, 0, front_wall])
      cylinder(d=di, h=h);
  }
};

cover();
