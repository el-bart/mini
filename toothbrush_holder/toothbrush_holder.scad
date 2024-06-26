use <m3d/fn.scad>
include <m3d/math.scad>


module lower_tub()
{
  translate([0, (20+4)/2, 0])
    difference()
    {
      cylinder(h=10+3+eps, r=(20+3)/2);
      translate([0,0,3])
        cylinder(h=10+3, r2=20/2, r1=16/2);
    }
}

module upper_ring()
{
  h = 10;
  wall = 5/2;
  d_int = 24;
  d_ext = d_int + 2*wall;

  module base_bottom()
  {
    module base()
    {
      difference()
      {
        cylinder(h=h, d=d_ext);
        translate([0, 0, -eps])
         cylinder(h=h+2*eps, d=d_int);
      }
    }

    module split()
    {
      q = max(h, d_ext) + 2*eps;
      s = q*[1,1,1];
      translate(-[s.x/2, 0, eps])
        cube(s);
    }

    difference()
    {
      base();
      split();
    }
  }

  module base_top()
  {
    module split_2d()
    {
      q = max(h, d_ext) + 2*eps;
      s = q*[1,1];
      translate(-[s.x/2, 0])
        square(s);
    }

    module int_2d()
    {
      resize([0, 1.5*d_ext, 0])
        circle(d=d_int);
    }

    module core_2d()
    {
      intersection()
      {
        difference()
        {
          offset(r=wall)
            int_2d();
          int_2d();
        }
        split_2d();
      }
    }

    linear_extrude(h)
      core_2d();
  }

  translate([0, (24+5)/2, 0])
  {
    base_bottom();
    base_top();
  }
}


module back_wall()
{
  // lower part
  translate([-40/2, 0, 0])
    cube([40, 3, 20]);
  // upper part
  translate([-40/2, 0, 100-10])
    cube([40, 3, 20]);
  // connector
  translate([-10/2, 0, 0])
    cube([10, 3, 100]);
}


module brush_holder()
{
  lower_tub();
  translate([0,0,100-5])
    upper_ring();
  back_wall();
  // lower mounting
  difference()
  {
    translate([-15/2, 3, 0])
      cube([15, 4, 10+3]);
    hull()
      lower_tub();
  }
  // upper mounting
  translate([0, 0, 100-5])
  {
    difference()
    {
      translate([-25/2, 3, eps])
        cube([25, 10, 10-2*eps]);
      hull()
        upper_ring();
    }
  }
}


module holder(names)
{
  $fn=fn(100);
  brushes_count = len(names);
  rotate([90, 0, 0])
  {
    for(i = [0:brushes_count-1])
    {
      translate([i*30,3,55])
        rotate([-90, -90, 0])
          scale([2,1,1])
            linear_extrude(height=1)
              text(names[i], size=7, halign="center", valign="center");
      translate(i * [30, 0, 0])
        brush_holder();
    }
  }
}


holder(["JOHN" , "JANE", "BILLY"]);
