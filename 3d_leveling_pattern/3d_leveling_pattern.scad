N = 5;
d = 20;
h = 2;
edge_dist = 20;
len_x = 400-2*edge_dist-2*d/2;
len_y = len_x;

translate((d/2)*[1,1,0] + edge_dist*[1,1,0])
  for(i=[0:N-1])
    for(j=[0:N-1])
      translate([j*(len_x/(N-1)), i*(len_y/(N-1)), 0])
        cylinder(d=d, h=h, $fn=100);
