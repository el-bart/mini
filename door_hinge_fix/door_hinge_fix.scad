module distance_fixer(extra_d)
{
  difference()
  {
    d_real=7;
    d=d_real+extra_d;
    cube([12, 40, 22-16]);
    for(dy = [5+d_real/2, 40-6-d_real/2])
      translate([12/2, dy, -5])
        cylinder(r=d/2, h=20, $fs=0.1);
  }
}

translate([0*15, 0, 0])
  distance_fixer(1);

translate([1*15, 0, 0])
  distance_fixer(1.5);

translate([2*15, 0, 0])
  distance_fixer(2);