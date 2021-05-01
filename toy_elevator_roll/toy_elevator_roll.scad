eps=0.01;
r_stick=2.8/2; // extr_width=0.4, d=2.5mm, thus 7*0.4=2.8 as a next best thing

module roller()
{
  difference()
  {
    cylinder(r=20/2, h=5, $fn=200);
    translate([0, 0, -eps])
      cylinder(r=r_stick, h=5+2*eps, $fn=200);
  }
  translate([20/2-5/2, 0, 5])
    cylinder(r=5/2, h=20, $fn=100);
}

module spool_body_()
{
  r_ext=(5+2*3)/2;
  r_int=r_stick+1;

  difference()
  {
    union()
    {
      cylinder(r1=r_ext, r2=r_int, h=5.5, $fn=150);
      translate([0, 0, 5.5+3])
        cylinder(r1=r_int, r2=r_ext, h=5.5, $fn=150);
      translate([0, 0, 5.5])
        cylinder(r=r_int, h=3, $fn=100);
    }
    translate([0, 0, -eps])
      cylinder(r=r_stick, h=2*5.5+3+2*eps, $fn=200);
  }
}

module hook_()
{
  r_int=1/2;
  r_ext=r_int+1;

  difference()
  {
    translate([-2, -1.5/2, 0])
      cube([2, 1.5, 3+2*3]);
    
    translate([-1, 0, (3+2*3)/2])
      translate([0, 1, 0])
        rotate([90, 0, 0])
          translate([0, 0, -eps])
            cylinder(r=1/2, h=2+2*eps, $fn=200);
  }
}

module spool()
{
  spool_body_();
  translate([-1.8, 0, 2.5])
    hook_();
}

roller();
translate([20, 0, 0])
  spool();
