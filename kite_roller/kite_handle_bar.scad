use <m3d/screw_head_hex.scad>

eps = 0.01;
d_rod = 8+0.5;
d_hand = 20;
h_hand = 110;

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


module screw_head() { screw_head_hex_m8(); }

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
  screw_head_hex_m8(d_spacing, h_spacing);

  for(dh=[-1.4, 7+h_spacing])
    translate([0, 0, dh])
      washer();
}


module bearing_mount()
{
  $fn=90;
  wall = 5;
  d_ext = 22+2*wall;

  // bottom bearing hold
  difference()
  {
    cylinder(d=d_ext, h=7);
    translate([0,0,-eps])
      cylinder(d=22+0.5, h=7+2*eps, $fn=180);
  }
  %bearing();

  translate([0, 0, 7])
  {
    // connecting element
    difference()
    {
      cylinder(d1=d_ext, d2=d_hand, h=(d_ext-d_hand)/2);
      cylinder(d1=d_ext-2*wall+0.5, d2=d_rod, h=(d_ext-d_hand)/2);
    }
    
    // main e
  }
}


module handle()
{
  h_bm = 13;
  // bottom bearing mount
  bearing_mount();
  translate([0, 0, h_bm])
  {
    // center rod
    difference()
    {
      cylinder(d=d_hand, h=h_hand, $fn=100);
      cylinder(d=d_rod, h=h_hand, $fn=100);
    }
    // top bearing mount
    translate([0, 0, h_hand])
      translate([0, 0, h_bm])
        mirror([0,0,1])
          bearing_mount();
  }
}


for(i=[0:1])
  translate(i*[35,0,0])
    handle();
