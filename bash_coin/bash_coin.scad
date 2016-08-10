N=2;
M=3;

module coin()
{
  cylinder(r=25/2, h=1, $fs=0.1);

  translate([-9, -7, 1])
    linear_extrude(height=1.5)
      text(text=str("#!"), size=16, halign=[0,"left"]);
}



for(i = [0:N-1])
  for(j = [0:M-1])
    translate([i*30, j*30, 0])
      coin();
