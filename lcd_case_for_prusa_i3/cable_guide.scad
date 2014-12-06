module cableGuide()
{
  hull()
  {
    // upper baund
    translate([0, 20, 0])
      cube([75, 1, 6+7]);
    // lower baund
    cube([60, 1, 6+7]);
  }
}

cableGuide();