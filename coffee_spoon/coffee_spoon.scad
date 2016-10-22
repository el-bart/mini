module halfSphere(r)
{
  difference()
  {
    sphere(r);
    d=r+1;
    translate([-d, -d, -d])
      cube([2*d, 2*d, d]);
  }
}


r=17.743;
difference()
{
  halfSphere(19);
  halfSphere(r);
}
translate([-15/2, +r-1, 0])
  cube([15, 140, 5]);
