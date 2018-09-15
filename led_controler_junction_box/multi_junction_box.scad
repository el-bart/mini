use <junction_box.scad>;

for(i = [0:0])
  translate(i*[0, 83, 0])
    junction_box();
