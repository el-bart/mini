eps = 0.01;
N = 4;
M = 4;

module qiagen_logo()
{
  translate([-10.5, -9, 0])
    translate([0,0,1+1])
      linear_extrude(1)
        scale(.42*[1,1])
          import("qiagen_logo.svg");
}

module qiabasz()
{
  difference()
  {
    cylinder(d=30, h=1+1, $fn=100);
    translate([0,0,-eps])
      linear_extrude(1+eps)
        mirror([1, 0, 0])
          text("#!", size=18, halign="center", valign="center");
  }
  qiagen_logo();
}


for(i=[0:N-1])
  for(j=[0:M-1])
    translate([i*32, j*32, 0])
      qiabasz();
