$fn=20;

translate([-5, -5, 0])
  cube([15+2*5, 10, 0.2]);

for(i=[0:1])
  translate(i*[15, 0, 0])
    cylinder(r=5/2, h=20);
