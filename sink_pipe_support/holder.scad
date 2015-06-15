module holder()
{
  cylinder(h=5, r=50);
  d=30;
  e=d+4;
  h=5+40;
  difference()
  {
    translate([-e/2, -e/2, 0])
      cube([e, e, h]);
    translate([-d/2, -d/2, 0])
      cube([d, d, h]);
    translate([-h/2, 0, h-10])
      rotate([0, 90, 0])
        cylinder(r=5+1, h=h);
  }
}

holder();