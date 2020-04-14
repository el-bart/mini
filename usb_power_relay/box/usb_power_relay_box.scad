$fa=1;
$fs=0.5;
wall=1.5;

module bottom()
{
  translate(wall*[1, 1, 1])
    cube([45, 60, wall]);
  cube([45+2*wall, 60+2*wall, wall]);
}

module cover()
{
  translate([0, 0, 25+2*wall])
    rotate([180, 0, 0])
      difference()
      {
        cube([45+2*wall, 60+2*wall, 25+2*wall]);
        translate(wall*[1,1,0])
          cube([45, 60, 25+wall]);
        translate([-5, 8/2+wall+3, wall+8])
          hull()
            for(dz=[0, -10])
              translate([0, 0, dz-8/2])
                rotate([0, 90, 0])
                  cylinder(r=8/2, h=60);
        translate([(45+2*wall)/2, 60, wall+3])
          hull()
            for(dz=[0, -10])
              translate([0, 0, dz-3/2])
                rotate([-90, 0, 0])
                  cylinder(r=3/2, h=4*wall);
      }
}


bottom();
translate([0, -5, 0])
  cover();
