wall=2;
spacing=0.4;
r_int=30.5/2;
r_round=4;
r_tube=16.5/2;
h=25;
magnet_size=[5, 5, 2];
$fn=1/3*360;


module ring_(r_ring, r_round)
{
//  $fn=200;
  rotate_extrude()
    translate([r_ring-r_round, 0, 0])
      circle(r=r_round);
}

module rounded_cylinder_(r_cyl, r_round, h)
{
  translate(r_round*[0,0,1])
  {
    for(dz=[0,h-2*r_round])
      translate([0,0,dz])
        hull()
          ring_(r_cyl, r_round);
    cylinder(r=r_cyl, h=h-2*r_round);
  }
}

module empty_cylinder_()
{
  
  difference()
  {
    rounded_cylinder_(r_int + spacing + wall, r_round, h);
    translate(wall*[0,0,1])
      rounded_cylinder_(r_int + spacing, r_round, h);
  }
}

module internal_tube_()
{
  rts=r_tube - spacing;
  th=5.5+spacing;
  sp_size=magnet_size + spacing*[2,2,0];
  difference()
  {
    cylinder(r=rts, h=th);
    for(dy=[-1,1])
      translate(dy*[0, 3.5, 0]) // offset
        translate([-sp_size[0]/2, -sp_size[1]/2, th-sp_size[2]]) // center
          cube(sp_size);
  }
}

module cap()
{
  empty_cylinder_();
  translate(wall*[0,0,1])
    internal_tube_();
}


cap();
