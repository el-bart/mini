rotate_extrude(angle=360)
  intersection()
  {
    translate([-170/2, 0])
      resize([170, 280])
      import("model.svg");
    square(300*[1,1]);
  }
