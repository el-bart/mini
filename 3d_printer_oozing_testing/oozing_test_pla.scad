$fn=20;
N=3;
M=3;
d=5;
space=10;

translate([-d, -d, 0])
  cube([N*space, M*space, 0.2]);

for(i=[0:N-1])
  for(j=[0:M-1])
    translate(space*[i, j, 0])
      cylinder(d1=d, d2=1, h=20);
