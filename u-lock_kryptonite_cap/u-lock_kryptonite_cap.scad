wall=2;
spacing=0.5;
r_int=30.5/2;
r_round=wall;
h=25;
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


empty_cylinder_();
