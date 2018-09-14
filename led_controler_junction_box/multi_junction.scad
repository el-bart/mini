use <junction_box.scad>;

for(i = [0:2])
  translate(i*[0, 83, 0])
    junction_box();
