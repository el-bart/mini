for(i = [0:2])
{
  translate(i*[20, 0, 0])
    difference()
    {
      cylinder(r=(17+2)/2, h=30);
      cylinder(r=(17+0)/2, h=31);
    }
}

translate([-(17+1)/2-5,  -(17+1)/2-1, 0])
  cube([20*3+2*5, 20, 2]);
