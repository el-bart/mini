eps = 0.01;

module bender(r, angle, length, dh)
{
  n = floor(length / dh);
  da = angle / n;

  module cut_2d(h)
  {
    projection(cut=true)
      translate([0, 0, -h])
        children();
  }

  for(i = [0:n-1])
  {
    a = i*da;
    h = i*dh;
    echo(i, a, h);
    rotate([0, a, 0])
      rotate([-90, 0, 0])
        rotate_extrude(angle=da)
          translate([-r, 0, 0])
            cut_2d(h)
              children();
  }
}


module straight_tube(s1, s2, h, wall)
{
  module chimney(s1, s2, h)
  {
    hull()
    {
      linear_extrude(eps)
        translate(-0.5*[s1.x, s1.y])
          square(s1);
      translate([0, 0, h])
        linear_extrude(eps)
          translate(-0.5*[s2.x, s2.y])
            square(s2);
    }
  }

  difference()
  {
    chimney(s1, s2, h);
    translate([0,0,-eps])
      chimney(s1-wall*[2,2], s2-wall*[2,2], h+2*eps);
  }
}

h = 40;
bender(r=40, angle=90, length=h, dh=0.2)
  straight_tube(s1=[10, 30], s2=[5, 15], h=h, wall=1.6);


module object(h)
{
  difference()
  {
    cylinder(d1=20, d2=5, h=h);
    translate([-3/2, -3/2, -eps])
      cube([3,3,h+2*eps]);
  }
}



//h = 30;
//bender(r=40, angle=45, length=h, dh=0.2)
//  object(h=h);
