ball_radius=610/2;  // [mm]

module theBall()
{
  translate([0, 0, ball_radius+2])
    sphere(r=ball_radius, $fn=100);
}

difference()
{
  cylinder(r=ball_radius/5, h=20, $fn=100);
  #theBall();
}
