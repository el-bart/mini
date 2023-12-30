module house(h=0.01)
{
  linear_extrude(h)
    scale(0.76) // side wall is 140mm high
      import("house.svg");
}

house();
