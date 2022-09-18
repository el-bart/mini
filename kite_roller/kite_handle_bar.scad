eps = 0.01;
d_rod = 8+2*1; // need a lot of space, for a smooth move
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

  // connecting element
  translate([0, 0, 7])
    difference()
    {
      cylinder(d1=d_ext, d2=d_hand, h=(d_ext-d_hand)/2);
      cylinder(d1=d_ext-2*wall+0.5, d2=d_rod, h=(d_ext-d_hand)/2);
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
