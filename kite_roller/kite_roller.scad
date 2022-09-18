use <m3d/screw_head_hex.scad>

eps = 0.01;

// standard ball bearing: 8x22x7mm
module bearing()
{
  difference()
  {
    cylinder(d=22, h=7, $fn=100);
    translate(eps*[0,0,-1])
      cylinder(d=8, h=7+2*eps, $fn=40);
  }
}


module screw_head_slot(dh=0)
{
  screw_head_hex_m8(0.5, 2*0.2+dh);
}


module washer(dh=0)
{
  difference()
  {
    cylinder(d=15.5, h=1.4+dh);
    translate(eps*[0,0,-1])
      cylinder(d=8.5, h=1.4+dh+2*eps);
  }
}


// slot for ball bearing + 2 washers
module bearing_slot()
{
  d_spacing = 0.5;
  h_spacing = 0.2;
  cylinder(d=22+d_spacing, h=7+h_spacing, $fn=150);

  for(dh=[-1.4, 7+h_spacing])
    translate([0,0,dh])
      washer();
}

module side_block()
{
  difference()
  {
    // main element
    cylinder(d1=120, d2=30, h=20, $fn=360);
    // screw slot
    translate([60/2, 0, -eps])
    {
      screw_head_slot(0.5);
      // rod
      cylinder(d=8+0.55, h=100, $fn=50);
      translate([0, 0, 12])
        washer(dh=100);
    }
  }
}

side_block();
