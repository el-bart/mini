module mount(screws)
{
  eps=0.1;
  wall=5;
  screw_d=3.5+1;
  ls_dim=[236+1, 162+1];
  ls_border=11.6-2;
  mount_len=20*screws;
  mount_size=[30, 2*wall, mount_len+wall];

  module body_mount()
  {
    difference()
    {
      cube([ls_dim[0]+2*wall, ls_dim[1]+1*wall, mount_len+wall]);
      translate(wall*[1,1,1])
        cube([ls_dim[0], ls_dim[1]+eps, mount_len+eps]);
      translate(wall*[2,2,0]-[0,0,eps])
        cube([ls_dim[0]-2*wall, ls_dim[1]-1*wall+eps, wall+2*eps]);
    }
  }

  module screw_mount()
  {
    module screw()
    {
      rotate([-90, 0, 0])
        union()
        {
          $fn=50;
          cylinder(r1=(2*screw_d)/2, r2=screw_d/2, h=5);
          translate([0, 0, 5-eps])
            cylinder(r=screw_d/2, h=5+eps+10);
        }
    }

    translate([-mount_size[0], 0, 0])
      difference()
      {
        mss2=mount_size[2]/screws;
        cube(mount_size);
        #for(i=[1:screws])
          translate([mount_size[0]/2, -eps, mss2*i-mss2/2])
            screw();
      }
  }

  body_mount();
  for(i=[0,1])
    translate([i*(ls_dim[0]+2*wall+mount_size[0]), ls_dim[1]-wall, 0])
      screw_mount();
}

mount(screws=3);
