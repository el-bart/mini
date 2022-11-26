use <m3d/fn.scad>

names = ["JOHN", "JANE", "BILLY"];
brushes_count = len(names);
$fn=fn(200);


module lower_tub()
{
  translate([0, (20+4)/2, 0])
    difference()
    {
      cylinder(h=10+3, r=(20+3)/2);
      translate([0,0,3])
        cylinder(h=10+3, r2=20/2, r1=16/2);
    }
}

module upper_ring()
{
  translate([0, (24+5)/2, 0])
    difference()
    {
      cylinder(h=10, r=(24+5)/2);
      cylinder(h=10, r=(24+0)/2);
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
    translate([0, 0.1, 0]) // needed to make model simple (aka: manifold)
      hull()
        lower_tub();
  }
  // upper mounting
  translate([0, 0, 100-5])
  {
    difference()
    {
      translate([-25/2, 3, 0])
        cube([25, 10, 10]);
      translate([0, 0.1, 0]) // needed to make model simple (aka: manifold)
        hull()
          upper_ring();
    }
  }
}


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
