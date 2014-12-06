module cableGuide()
{
  hull()
  {
    // upper baund
    translate([0, 20, 0])
      cube([75, 1, 6+7]);
    // lower baund
    translate([(75-40)/2, 0, 0])
      cube([40, 1, 6+7]);
  }
}

cableGuide();