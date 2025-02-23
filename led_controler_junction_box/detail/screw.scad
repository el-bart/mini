module screw()
{
  size = 6;
  height=3;
  translate([0, 0, height/2])
    intersection()
    {
      cube([size, size, height], center=true);
      rotate([0,0,45])
        cube([size, size, height], center=true);
    }
}

%screw();
