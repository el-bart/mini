use <battery.scad>
include <config.inc>

module batteriesPack(s)
{
  for(i = [0:3])
    translate([hull+radius+i*(diameter+spacing), hull, hull+radius])
      rotate([-90,0,0])
        scale(s)
          batteryAA();
}

batteriesPack([margin, margin, margin]);
