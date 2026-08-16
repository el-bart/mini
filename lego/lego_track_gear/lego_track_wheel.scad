include <m3d/all.scad>

module lego_track_wheel(n, h=5)
{
  // based on LEGO 57519
  r_orig = 20.5;
  n_orig = 10;

  alpha = 2 * asin(7.5/2 / r_orig);     // angle of upper part
  alpha_beta = 360 / n_orig;
  beta = alpha_beta - alpha;            // angle of cut-in (at the top-to-top)
  l_tooth = (alpha_beta / 360) * 2*pi*r_orig;

  function arc4r(a, r1, r2) = a*r1/r2;
  function alpha4r(r) = arc4r(alpha, r_orig, r);
  function beta4r(r)  = arc4r(beta,  r_orig, r);

  function circumference4n(n) = n*l_tooth;
  l = circumference4n(n);
  r = l / (2*pi);

  module beta_cut(dh)
  {
    hdh = h + dh;

    module arc_cut(angle, r, h)
    {
      rotate([0, 0, 90])
        rotate_extrude(angle=angle, $fn=111)
        square([r, h]);
    }

    module arc()
    {
      b = beta4r(r);
      rotate([0, 0, -b/2])
        difference()
        {
          arc_cut(angle=b,   r=r+1, h=hdh);
          arc_cut(angle=b+1, r=r,   h=hdh);
        }
    }

    module ball()
    {
      d = 2.2;
      translate([0, r - 2.8 + d/2, 0])
        cylinder(d=d, h=hdh, $fn=fn(40));
    }

    hull()
    {
      arc();
      ball();
    }
  }

  module lego_axle_slot(length)
  {
    module lego_axle(length, spacing=0)
    {
      y = 1.80 + 2*spacing;
      x = 4.75 + 2*spacing;
      linear_extrude(length)
        for(dr=[0, 90])
          rotate([0, 0, dr])
            square([x, y], center=true);
    }

    lego_axle(length=length, spacing=0.3);
  }

  difference()
  {
    cylinder(r=r, h=h, $fn=fn(100));

    translate([0,0,-eps])
      lego_axle_slot(h+3*eps);

    abr = alpha4r(r) + beta4r(r);
    for(a = [0 : abr : 360])
      rotate([0, 0, a])
        translate([0, 0, -eps])
        beta_cut(dh=2*eps);
  }
}


lego_track_wheel(n=6);
