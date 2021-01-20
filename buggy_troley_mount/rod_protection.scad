h=15;
eps=0.01;
$fn=120;


module rod_protection()
{
  difference()
  {
    cylinder(r=10.5/2, h=h);
    translate([0,0,-eps])
      cylinder(r=8.5/2, h=h+2*eps);
  }
}


for(dx=[0:1])
  for(dy=[0:2])
    translate(12*[dx, dy, 0])
      rod_protection();
