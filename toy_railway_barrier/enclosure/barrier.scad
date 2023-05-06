eps = 0.01;

module barrier()
{
  difference()
  {
    cube([130, 10, 4]);
    translate([-eps, 2/2, 2])
      cube([20+eps, 8, 2+eps]);
  }
}

barrier();
