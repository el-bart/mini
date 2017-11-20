module holder()
{
  translate([0,0,110])
    rotate([90,0,0])
      difference()
      {
        translate([-70/2, -110, 0])
          cube([70, 140, 5]);
        cylinder(r=30/2, h=5, $fs=0.01);
        for(deg = [0, 120, 240])
          rotate(deg)
            #translate([0, 21.25, -1])
              cylinder(r=3.5/2, h=5+2*1, $fs=0.1);
      }
}

rotate([-90, 0, 0])
{
  holder();
  translate([-120/2, -110, 0])
    cube([120, 110, 5]);
}