module top()
{
  cube([50, 70, 5]);
}

module bottom()
{
  cube([35, 35, 5]);
}


top();

translate([55, 0, 0])
  bottom();
