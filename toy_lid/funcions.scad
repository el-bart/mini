$fn=100;

module con()
{
  difference()
  {
    cylinder(h=20, r2=40/2, r1=15/2);
    translate([0,0,-3])
      cylinder(h=20+2*3, r=3.5/2);
    translate([0,0,9.5])
      cylinder(h=20, r=6/2);
  }
}

module lid(internal_diameter, external_diameter)
{
  difference()
  {
    cylinder(r=external_diameter/2, h=3);
    translate([0,0,-1])
      cylinder(r=3.5/2, h=3+2*1);
  }
  difference()
  {
    cylinder(r=internal_diameter/2,   h=3+10);
    cylinder(r=internal_diameter/2-3, h=3+10+1);
  }
}

//con();
//lid(internal_diameter=100, external_diameter=120);
