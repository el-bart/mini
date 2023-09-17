use <m3d/fn.scad>

eps = 0.01;

module plate(d_in, d_out, h_in, wall)
{
  module mask(n, w, l, d_off)
  {
    tl = l+d_off;
    difference()
    {
      circle(d=tl-w);
      for(i=[0:n-1])
        rotate([0, 0, i*360/(2*n)])
          square([2*tl, w], center=true);
    }
  }
  difference()
  {
    cylinder(d=d_out, h=wall, $fn=fn(3*d_out));
    translate([0, 0, -eps])
      linear_extrude(wall+2*eps)
        mask(n=4, w=8, l=d_out-d_in-10, d_off=d_in+10/2);
  }
}


module led_spool_left(d_in, d_out, h_in, wall)
{
  h = 2*wall+h_in;
  difference()
  {
    union()
    {
      plate(d_in, d_out, h_in, wall);
      cylinder(d=d_in, h=h, $fn=fn(d_in*5));
    }
    translate(-d_in/2/2*[1,1,0] + [0,0, wall])
      cube(d_in/2*[1,1,h]);
  }
}

module led_spool_right(d_in, d_out, h_in, wall)
{
  h = 2*wall+h_in;
  plate(d_in, d_out, h_in, wall);
  translate(-(d_in/2-1)/2*[1,1,0] + [0,0, wall])
    cube((d_in/2-1)*[1,1,0] + [0,0,h-wall-1]);
  cylinder(d=d_in, h=wall, $fn=fn(d_in*5));
}


module led_spool(d_in, d_out, h_in, wall, mock=true)
{
  led_spool_left(d_in, d_out, h_in, wall);
  if(mock)
    %translate([0, 0, 1+3*wall+h_in])
      mirror([0, 0, 1])
        led_spool_right(d_in, d_out, h_in, wall);

  translate([0, d_out+2, 0])
    led_spool_right(d_in, d_out, h_in, wall);
}


led_spool(d_in=36, d_out=126, h_in=10, wall=1.2);
