module screw()
{
  intersection()
  {
    size = 6;
    height=3;
    cube([size, size, height], center=true);
    rotate([0,0,45])
      cube([size, size, height], center=true);
  }
}

%screw();
