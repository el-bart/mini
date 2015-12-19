use <battery.scad>

margin   = 1.05;
hull     = 2;
spacing  = 2;
diameter = 14.5;
radius   = diameter/2;
sizeOX   = 2*hull + 4*diameter + 3*spacing;
sizeOY   = 2*hull + 48.5+2;
sizeOZ   = 2*hull + diameter;

module batteriesPack(s)
{
  for(i = [0:3])
    translate([hull+radius+i*(diameter+spacing), hull, hull+radius])
      rotate([-90,0,0])
        scale(s)
          batteryAA();
}


difference()
{
  cube([sizeOX, sizeOY+2, sizeOZ/2]);
  batteriesPack([margin, margin, margin]);
}
%batteriesPack([1,1,1]);