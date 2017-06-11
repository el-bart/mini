count=2;

module tusk(h, l)
{
  translate([l,0,0])
    rotate([0,0,90])
      polyhedron(
        points=[
                 [0,   0,  0],  // 0
                 [h,   0,  0],  // 1
                 [h/2, 0,  h],  // 2
                 [0,   l,  0],  // 3
                 [h,   l,  0],  // 4
                 [h/2, l,  h]   // 5
               ],
        faces=[
                [0,2,1],
                [0,1,4],
                [4,3,0],
                [1,2,5],
                [5,4,1],
                [0,5,2],
                [3,5,0],
                [3,4,5]
              ]
      );
}

module side()
{
  w =20; // width
  tc=8;  // Tusks Count
  th=5;  // Tusk Height
  ph=3;  // Platform Height
  l =tc*1.5*th-0.5*th; // length
  // tusks:
  for(dy = [0:tc-1])
    translate([0, dy*1.5*th, ph])
      tusk(h=th, l=w);
  // base and mount
  phi=4; // diameter for screw
  pad=3; // padding around each hole
  ext=phi/2+pad; // external element size
  difference()
  {
    union()
    {
      translate([-ext,0,0])
        cube([w+2*ext, l, ph]);
    }
    // screw mounts
    for(dx = [-phi/2, w+phi/2])
      for(dy = [0, (tc-2)*th*1.5-th*1.5])
        translate([dx, dy+1.5*th-th/4, -ph])
          hull()
            for(offy = [0, th*1.5])
              translate([0,offy,0])
                cylinder(h=ph*3, r=phi/2, $fs=1);
  }
}


for(i = [0:count-1])
  translate([i*35,0,0])
    side();

%translate([20, 4, 15])
%  rotate([0,180,0])
%    side();
