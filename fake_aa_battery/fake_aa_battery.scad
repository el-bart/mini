N = 2;
M = 4;

module fake_aa_battery()
{
  cylinder(d=14.5, h=48, $fn=60);
  cylinder(d=5, h=50.5, $fn=30);
}



for(dx=[0:N-1])
  for(dy=[0:M-1])
    translate(16*[dx, dy, 0])
      fake_aa_battery();
