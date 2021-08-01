eps = 0.1;
th0 = 2.4; // original thickness
dth = 4; // extra thickness for the model
th  = th0 + dth;
h = 10;

fi = 3.5; // fi of screw
x1 = 18.5;
y2 = 16.75;
x3 = 12.4;

// screw block
translate([0, -th, 0])
  difference()
  {
    cube([x1, th, h]);
    translate([x1 - 10.5 - fi/2, -eps, h/2])
      rotate([-90, 0, 0])
        cylinder(r=fi/2, h=th+2*eps, $fn=30);
  }

// connector
translate([x1-th, -y2, 0])
  cube([th, y2, h]);

// block
translate([-dth, 0, 0])
  translate([x1-th0, -y2-th+th0, 0])
    cube([x3+dth, th, h]);
