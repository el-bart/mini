module house(h=0.01)
{
  linear_extrude(h)
    import("house.svg");
}

house();
