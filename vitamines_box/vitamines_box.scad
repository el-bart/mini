$fs=0.1;
$fa=3;

space = 2*5;        // extra space added to actual bottle size
wall = 3;           // wall thickness
height = 20+wall;   // height of a whole thing

module tran()
{
  hull()
    for(dx=[-1:+1])
      translate([dx*(75-40)/2, 0, 0])
        cylinder(r=(40+space)/2, h=height);
}

module large_bottle()
{
  cylinder(r=(35+space)/2, h=height);
}

module small_bottle()
{
  cylinder(r=(25+space)/2, h=height);
}


difference()
{
  cx=2*(75+space)+3*wall;
  cy=40+space+3*wall + 35+space/2+2*wall;
  cube([cx, cy, height]);
  translate([0, 0, wall])
  {
    for(dx=[cx/4, cx*3/4])
      translate([dx, cy-(40+space)/2-wall, 0])
        tran();
    translate([(35+space)/2+wall, (35+space)/2+wall, 0])
      large_bottle();
    for(dx=[0:2])
      translate([35+space+2*wall + (25+space)/2 + 7 + dx*(25+space+wall), (40+space)/2, 0])
        small_bottle();
  }
}
