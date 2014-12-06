module cableGuide()
{
  hull()
  {
    // upper baund
    translate([0, 20, 0])
      cube([98, 1, 6+7]);
    // lower baund
    translate([(98-70)/2, 0, 0])
      cube([70, 1, 6+7]);
  }
}

cableGuide();