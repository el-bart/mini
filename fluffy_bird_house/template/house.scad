module house(h=0.01, show=$preview)
{
  if(show)
    linear_extrude(h)
      import("house.svg");
}

house();
