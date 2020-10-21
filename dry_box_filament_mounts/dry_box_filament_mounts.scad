eps=0.01;

module external()
{
  w = 48 + 2*5;
  l = 50;
  h = 3;
  r_hole = (3+0.5)/2;
  spacing = 3+r_hole;
  difference()
  {
    cube([w, l, h]);
    for(dx=[spacing, w-spacing])
      for(dy=[spacing, l-spacing])
        translate([dx,dy,-eps])
          cylinder(r=r_hole, h=3+2*eps, $fn=60);
  }
}

module internal(blocker)
{
  wall = 3;
  r_int = 42/2;
  r_ext = r_int + wall;
  h = 25;

  external();

  translate([5, 0, 3])
  {
    // main holder round cut-in
    translate([48/2, r_ext, 0])
    {
      difference()
      {
        cylinder(r=r_ext, h=h, $fn=180);
        cylinder(r=r_int, h=h+eps, $fn=180);
        translate([-eps-r_ext, 0, -eps])
          cube([2*(r_ext+eps), r_ext+eps, h+2*eps]);
      }
    }
    // side wall, to prevent rod from falling out
    for(dx=[0, 2*r_ext-wall])
      translate([dx, r_ext, 0])
        cube([wall, r_int*2/3, h]);
    // element to prevent rod from rolling.
    if(blocker)
      translate([r_ext-wall/2, wall, 0])
        cube([wall, 10, h*2/3]);
  }
}

module repel_disc()
{
  r_int=(40.5+0.8)/2;
  difference()
  {
    union()
    {
      cylinder(r=100/2, h=2, $fn=120);
      cylinder(r=r_int+3, h=2+5, $fn=30);
    }
    translate([0, 0, -eps])
      cylinder(r=r_int, h=2+5+2*eps, $fn=360);
  }
}


for(set=[[true, 0], [false, 60]])
  translate([set[1], 0, 0])
  {
    internal(blocker=set[0]);
    translate([0, -53, 0])
      external();
  }

for(i=[0:1])
  translate([170-i*30, i*100, 0])
    repel_disc();